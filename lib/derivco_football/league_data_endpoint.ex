defmodule DerivcoFootball.LeagueDataEndpoint do
  @moduledoc """
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
  
  defp handle_get_json_league_season_pairs(conn) do
    case GenServer.call(DerivcoFootball.LeagueDataServer,
                        :get_league_season_pairs) do
      {:ok, league_season_pairs} ->
        league_season_pairs
        |> MapSet.to_list()
        |> Poison.encode()
        |> case do
            {:ok, league_season_json_pairs} ->
              send_resp(conn, 200, league_season_json_pairs)            
            {_, _} -> send_resp(conn, 500, "Sever error.")
           end
      {:error, :bad_league_season_pair} -> send_resp(conn, 400, "Bad league/season pair.")
      {_, _} -> send_resp(conn, 500, "Sever error.")
    end
  end

  defp handle_json_get_league_season_results(conn, league_season_pair) do
    case GenServer.call(DerivcoFootball.LeagueDataServer,
                        {:get_league_season_results,
                         league_season_pair}) do
      {:ok, league_season_results} ->          
            # ***NB***
            # Calling 'reformat_league_season_result', even though it returns protobuf structs,
            # ISN'T a mistake. It's a happy accident. The exprotobuf gives us elixir structs as 
            # part of processing the protobuf schema. These structs are in the same form that we 
            # need for JSON (since all the data is the same), so we can reuse them here.
            league_season_results
            |> Enum.map(fn league_season_result -> reformat_league_season_result league_season_result end)
            |> Poison.encode()
            |> case do
                 {:ok, league_season_json_results} -> 
                   send_resp(conn, 200, league_season_json_results)
                 {_, _} -> send_resp(conn, 500, "Sever error.")
               end
      {:error, :bad_league_season_pair} -> send_resp(conn, 400, "Bad league/season pair.")
      {_, _} -> send_resp(conn, 500, "Sever error.")
    end
  end
 
  defp handle_protobuf_get_league_season_pairs(conn) do
    case GenServer.call(DerivcoFootball.LeagueDataServer,
                        :get_league_season_pairs) do
      {:ok, league_season_pairs} ->
        league_season_pairs
        |> MapSet.to_list()
        |> (&ProtobufMessages.LeagueSeasonPairs.new(values: &1)).()
        |> ProtobufMessages.LeagueSeasonPairs.encode()
        |> (&send_resp(conn, 200, &1)).()
      {_, _} -> send_resp(conn, 500, "Sever error.")
    end
  end
  
  defp handle_protobuf_get_league_season_results(conn, league_season_pair) do
    case GenServer.call(DerivcoFootball.LeagueDataServer,
                        {:get_league_season_results,
                        league_season_pair}) do
      {:ok, league_season_results} ->
        league_season_results
        |> Enum.map(fn league_season_result -> reformat_league_season_result league_season_result end)
        |> (&ProtobufMessages.LeagueSeasonPairResults.new(leagueSeasonPairResult: &1)).()
        |> ProtobufMessages.LeagueSeasonPairResults.encode()
        |> (&send_resp(conn, 200, &1)).()
      {:error, :bad_league_season_pair} ->
        send_resp(conn, 400, "Bad league/season pair.")
      {:error, _description} -> send_resp(conn, 500, "Sever error.")
    end
  end

  defp handle_404(conn) do
    send_resp(conn, 404, "Sorry, nobody by that name lives here.")
  end

  defp reformat_league_season_result({{date, home_team, away_team},
                                      fthg,
                                      ftag,
                                      ftr,
                                      hthg,
                                      htag,
                                      htr}) do
    %ProtobufMessages.LeagueSeasonPairResult{
      date:      date,
      home_team: home_team,
      away_team: away_team,
      fthg:      fthg,
      ftag:      ftag,
      ftr:       ftr,
      hthg:      hthg,
      htag:      htag,
      htr:       htr}
  end
end
