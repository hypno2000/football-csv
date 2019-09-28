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

  defp handle_get_json_league_season_pairs(conn) do
    send_resp(conn, 200, "/api/json/league_season_pairs here")
  end

  defp handle_json_get_league_season_results(conn, league_season_pair) do
    send_resp(conn, 200, "/api/json/league_season_results/#{league_season_pair} here")
  end

  defp handle_protobuf_get_league_season_pairs(conn) do
    send_resp(conn, 200, "/api/protobuf/league_season_pairs here")
  end

  defp handle_protobuf_get_league_season_results(conn, league_season_pair) do
    send_resp(conn, 200, "/api/protobuf/league_season_results/#{league_season_pair} here")
  end

  defp handle_404(conn) do
    send_resp(conn, 404, "they like...aren't here or something")
  end
end
