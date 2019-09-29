defmodule DerivcoFootballTest do

  @moduledoc """
  As the data is coming in from external systems,
  we're going to make the assumption that the data
  has been validated before it's been made avalible.
  If this weren't the case, we'd have to deal with
  data validation bleeding across all system/service
  boundaries. This makes error handling and testing
  much more complicated and breaks encapsulation.
  """
  
  use ExUnit.Case
  doctest DerivcoFootball

  setup do
    HTTPoison.start()
  end

  # Test Data
  #
  # """
  # SP1,201617,20/08/2016,Barcelona,Betis,6,2,H,3,1,H
  # SP1,201516,30/04/2016,Ath Madrid,Vallecano,1,0,H,0,0,D
  # SP2,201617,11/06/2017,Numancia,Mirandes,0,2,A,0,0,D
  # SP2,201516,22/08/2015,Alcorcon,Mallorca,2,0,H,1,0,H
  # E0,201617,21/08/2016,West Ham,Bournemouth,1,0,H,0,0,D
  # D1,201617,13/05/2017,Freiburg,Ingolstadt,1,1,D,1,1,D
  # """

  test "/api/json/league_season_pairs endpoint" do
    case HTTPoison.get("http://localhost:4000/api/json/league_season_pairs") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        assert body ==
        "[\"D1_201617\",\"E0_201617\",\"SP1_201516\",\"SP1_201617\",\"SP2_201516\",\"SP2_201617\"]"
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code != 200 ->
        assert :false
      {:error, reason} ->
        IO.inspect reason
        assert :false
    end
  end

  test "/api/protobuf/league_season_pairs" do
    case HTTPoison.get("http://localhost:4000/api/protobuf/league_season_pairs") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        assert body ==
        "\n\tD1_201617\n\tE0_201617\n\nSP1_201516\n\nSP1_201617\n\nSP2_201516\n\nSP2_201617"
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code != 200 ->
        assert :false
      {:error, reason} ->
        IO.inspect reason
        assert :false
    end
  end

  test "/api/json/league_season_results/:league_season_pairs endpoint with valid parameter" do
    case HTTPoison.get("http://localhost:4000/api/json/league_season_results/E0_201617") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        assert body ==
        "[{\"htr\":\"D\",\"hthg\":0,\"htag\":0,\"home_team\":\"West Ham\",\"ftr\":\"H\",\"fthg\":1,\"ftag\":0,\"date\":\"21/08/2016\",\"away_team\":\"Bournemouth\"}]"
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code != 200 ->
        assert :false
      {:error, reason} ->
        IO.inspect reason
        assert :false
    end
  end

  test "/api/json/league_season_results/:league_season_pairs endpoint with invalid parameter" do
    case HTTPoison.get("http://localhost:4000/api/json/league_season_results/INVALID") do
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code == 400 ->
        assert :true
      {_, _} ->
        assert :false
    end
  end

  test "/api/protobuf/league_season_results/:league_season_pairs endpoint with valid parameter" do
    case HTTPoison.get("http://localhost:4000/api/protobuf/league_season_results/E0_201617") do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        assert body ==
        <<10, 49, 10, 10, 50, 49, 47, 48, 56, 47, 50, 48, 49, 54, 18, 8, 87, 101, 115, 116, 32, 72, 97, 109, 26, 11, 66, 111, 117, 114, 110, 101, 109, 111, 117, 116, 104, 32, 1, 40, 0, 50, 1, 72, 56, 0, 64, 0, 74, 1, 68>>
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code != 200 ->
        assert :false
      {:error, reason} ->
        IO.inspect reason
        assert :false
    end
  end

  test "/api/protobuf/league_season_results/:league_season_pairs endpoint with invalid parameter" do
    case HTTPoison.get("http://localhost:4000/api/protobuf/league_season_results/INVALID") do
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code == 400 ->
        assert :true
      {_, _} -> 
        assert :false
    end
  end

  test "invalid endpoint" do
    case HTTPoison.get("http://localhost:4000/INVALID") do
      {:ok, %HTTPoison.Response{status_code: status_code}}
      when status_code == 404 ->
        assert :true
      {_, _} -> 
        assert :false
    end
  end  
end
