defmodule DerivcoFootballTest do
  use ExUnit.Case
  doctest DerivcoFootball

  import Mock

  setup_with_mocks([
    {DerivcoFootball.LeagueData, [], [csvData: fn ->
"""
SP1,201617,20/08/2016,Barcelona,Betis,6,2,H,3,1,H
SP1,201516,30/04/2016,Ath Madrid,Vallecano,1,0,H,0,0,D
SP2,201617,11/06/2017,Numancia,Mirandes,0,2,A,0,0,D
SP2,201516,22/08/2015,Alcorcon,Mallorca,2,0,H,1,0,H
E0,201617,21/08/2016,West Ham,Bournemouth,1,0,H,0,0,D
D1,201617,13/05/2017,Freiburg,Ingolstadt,1,1,D,1,1,D
"""
                                     end]}
  ]) do
    :ok
  end

  test "china lake" do
    IO.inspect DerivcoFootball.LeagueData.csvData()
    :true
  end

  test "white sands" do
    IO.inspect DerivcoFootball.LeagueData.csvData()
    :true
  end
end
