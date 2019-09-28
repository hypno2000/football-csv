defmodule DerivcoFootball.LeagueDataEndpoint do
  @moduledoc """
  """

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:dispatch)

  get "/api/json/league_season_pairs" do
    send_resp(conn, 200, "/api/json/league_season_pairs here")
  end

  get "/api/json/league_season_results/:league_season_pair" do
    send_resp(conn, 200, "/api/json/league_season_results/#{league_season_pair} here")
  end

  get "/api/protobuf/league_season_pairs" do
    send_resp(conn, 200, "/api/protobuf/league_season_pairs here")
  end

  get "/api/protobuf/league_season_results/:league_season_pair" do
    send_resp(conn, 200, "/api/protobuf/league_season_results/#{league_season_pair} here")
  end

  get _ do
    send_resp(conn, 404, "they like...aren't here or something")
  end
end
