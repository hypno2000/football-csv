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
    send_resp(conn, 200, "/api/protobuf/league_season_results/#{league_season_pair} here")
  end

  defp handle_404(conn) do
    send_resp(conn, 404, "they like...aren't here or something")
  end
end


defmodule ProtobufMessages do
    use Protobuf, """
    message LeagueSeasonPairs{
      repeated string values = 2;
    }
    
    message LeagueSeasonPairResults{
      required uint32 oop = 1;
    }
  """
end
