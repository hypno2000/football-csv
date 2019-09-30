defmodule DerivcoFootball.LeagueDataEndpoint do
  @moduledoc """
  This module contains both the routing and handling for the
  HTTP API. As this is a small API and rather simple to implement,
  we're not using anything but Cowboy and Plug as the general
  "framework" along with ExProtobuf and Poison for handling the
  response endoding.

  The handlers call into another GenServer:
  `DerivcoFootball.LeagueDataServer`

  This server returns the data in tuple form that is then processed
  here into either JSON or Protocol Buffers.

  On thing to keep in mind, since it looks a little strange at
  first is that the 'reformat_league_season_result' function, that
  returns Protocol buffer structs, is used for processing both
  Protocol buffer *AND* JSON requests. This is due to the fact that
  these structs are generated automatically by ExProtobuf and have
  essentially the same structure as any custom structures we'd
  create manually.

  The only HTTP response codes are: 200, 400, 404, and 500. 400
  is returned for sending a bad league/season pair when requesting
  league/season results and 500 is returned for any unforseen errors;
  effectively a catch-all.

  There isn't a lot of defensive handling here for two reasons:

  1) the usual Elixir/Erlang/OTP practice of letting things crash,
  restart, and get figured out if there's an actual underlying
  problem

  2) by the time requests are here the data should already have
  been processed, stored, and in a good state.

  The individual API calls are documented in there handler's
  @doc strings.
  """

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:dispatch)

  #
  # external api
  #

  get "/api/json/league_season_pairs" do
    handle_get_json_league_season_pairs(conn)
  end

  get "/api/json/league_season_results/:league_season_pair" do
    handle_json_get_league_season_results(conn, league_season_pair)
  end

  get "/api/protobuf/league_season_pairs" do
    handle_protobuf_get_league_season_pairs(conn)
  end

  get "/api/protobuf/league_season_results/:league_season_pair" do
    handle_protobuf_get_league_season_results(conn, league_season_pair)
  end

  get _ do
    handle_404(conn)
  end

  #
  # internal handlers
  #

  alias DerivcoFootball.ProtobufMessages

  # This function returns all of the unique league/season
  # pairs available in the dataset. These are effectively
  # keys for retrieving the results for the that league
  # and season. This would typically be called at least
  # once, to get the available pairs before retriving
  # the results.
  #
  # This handler returns the pairs in JSON.
  defp handle_get_json_league_season_pairs(conn) do
    case GenServer.call(
           DerivcoFootball.LeagueDataServer,
           :get_league_season_pairs
         ) do
      {:ok, league_season_pairs} ->
        league_season_pairs
        |> MapSet.to_list()
        |> Poison.encode()
        |> case do
          {:ok, league_season_json_pairs} ->
            send_resp(conn, 200, league_season_json_pairs)

          {_, _} ->
            send_resp(conn, 500, "Server error.")
        end

      {:error, :bad_league_season_pair} ->
        send_resp(conn, 400, "Bad league/season pair.")

      {_, _} ->
        send_resp(conn, 500, "Server error.")
    end
  end

  # This is the primary informational function as it returns
  # the actual results for a league/season pair.
  #
  # This handler returns the results in JSON.
  defp handle_json_get_league_season_results(conn, league_season_pair) do
    case GenServer.call(
           DerivcoFootball.LeagueDataServer,
           {:get_league_season_results, league_season_pair}
         ) do
      {:ok, league_season_results} ->
        # ***NB***
        # Calling 'reformat_league_season_result', even though it returns protobuf structs,
        # ISN'T a mistake. It's a happy accident. The exprotobuf gives us elixir structs as 
        # part of processing the protobuf schema. These structs are in the same form that we 
        # need for JSON (since all the data is the same), so we can reuse them here.
        league_season_results
        |> Enum.map(fn league_season_result ->
          reformat_league_season_result(league_season_result)
        end)
        |> Poison.encode()
        |> case do
          {:ok, league_season_json_results} ->
            send_resp(conn, 200, league_season_json_results)

          {_, _} ->
            send_resp(conn, 500, "Server error.")
        end

      {:error, :bad_league_season_pair} ->
        send_resp(conn, 400, "Bad league/season pair.")

      {_, _} ->
        send_resp(conn, 500, "Server error.")
    end
  end

  # This function returns all of the unique league/season
  # pairs available in the dataset. These are effectively
  # keys for retrieving the results for the that league
  # and season. This would typically be called at least
  # once, to get the available pairs before retriving
  # the results.
  #
  # This handler returns the pairs in a Protocol Buffer
  defp handle_protobuf_get_league_season_pairs(conn) do
    case GenServer.call(
           DerivcoFootball.LeagueDataServer,
           :get_league_season_pairs
         ) do
      {:ok, league_season_pairs} ->
        league_season_pairs
        |> MapSet.to_list()
        |> (&ProtobufMessages.LeagueSeasonPairs.new(values: &1)).()
        |> ProtobufMessages.LeagueSeasonPairs.encode()
        |> (&send_resp(conn, 200, &1)).()

      {_, _} ->
        send_resp(conn, 500, "Server error.")
    end
  end

  # This is the primary informational function as it returns
  # the actual results for a league/season pair.
  #
  # This handler returns the results in a Protocol Buffer.
  defp handle_protobuf_get_league_season_results(conn, league_season_pair) do
    case GenServer.call(
           DerivcoFootball.LeagueDataServer,
           {:get_league_season_results, league_season_pair}
         ) do
      {:ok, league_season_results} ->
        league_season_results
        |> Enum.map(fn league_season_result ->
          reformat_league_season_result(league_season_result)
        end)
        |> (&ProtobufMessages.LeagueSeasonPairResults.new(leagueSeasonPairResult: &1)).()
        |> ProtobufMessages.LeagueSeasonPairResults.encode()
        |> (&send_resp(conn, 200, &1)).()

      {:error, :bad_league_season_pair} ->
        send_resp(conn, 400, "Bad league/season pair.")

      {:error, _description} ->
        send_resp(conn, 500, "Server error.")
    end
  end

  # Just a simple 404 handler.
  defp handle_404(conn) do
    send_resp(conn, 404, "Sorry, nobody by that name lives here.")
  end

  # This function is used for destructuring the league/season results.
  # It's a separate function so we can use pattern matching when we
  # map over the list of results.
  #
  # NB: As repeated elsewhere, even though this function returns
  # ExProtobuf structures, we use them for JSON as well since they
  # provide the same data and are automatically generated for us.
  defp reformat_league_season_result(
         {{date, home_team, away_team}, fthg, ftag, ftr, hthg, htag, htr}
       ) do
    %ProtobufMessages.LeagueSeasonPairResult{
      date: date,
      home_team: home_team,
      away_team: away_team,
      fthg: fthg,
      ftag: ftag,
      ftr: ftr,
      hthg: hthg,
      htag: htag,
      htr: htr
    }
  end
end
