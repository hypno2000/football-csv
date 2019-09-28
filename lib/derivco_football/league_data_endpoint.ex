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
    send_resp(conn, 200, "/api/json/league_season_pairs here")
  end

  defp handle_json_get_league_season_results(conn, league_season_pair) do
    send_resp(conn, 200, "/api/json/league_season_results/#{league_season_pair} here")
  end
 
  defp handle_protobuf_get_league_season_pairs(conn) do
    with {:ok, league_season_pairs} <- GenServer.call(DerivcoFootball.LeagueDataServer,
                                                      :get_league_season_pairs)
      do
      league_season_pairs
      |> MapSet.to_list()
      |> (&ProtobufMessages.LeagueSeasonPairs.new(values: &1)).()
      |> ProtobufMessages.LeagueSeasonPairs.encode()
      |> (&send_resp(conn, 200, &1)).()
      else
        {:error, description} -> IO.puts "oh noes! #{description}"
    end
  end
  
  defp handle_protobuf_get_league_season_results(conn, league_season_pair) do
    with {:ok, league_season_results} <- GenServer.call(DerivcoFootball.LeagueDataServer,
                                                        {:get_league_season_results,
                                                         league_season_pair})
      do
      league_season_results
      |> Enum.map(fn league_season_result -> reformat_league_season_result league_season_result end)
      |> (&ProtobufMessages.LeagueSeasonPairResults.new(leagueSeasonPairResult: &1)).()
      |> ProtobufMessages.LeagueSeasonPairResults.encode()
      |> (&send_resp(conn, 200, &1)).()
      
      else
        {:error, description} -> IO.puts "oh noes! #{description}"
    end
  end

  defp handle_404(conn) do
    send_resp(conn, 404, "they like...aren't here or something")
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
