defmodule DerivcoFootball do
  @moduledoc """
  Documentation for DerivcoFootball.
  """

  def start(type, args) do    


    result = DerivcoFootball.Application.start(type, args)

    # IO.inspect :ets.all()
    # IO.inspect :ets.tab2list(String.to_existing_atom("E0_201617"))

    GenServer.call(DerivcoFootball.LeagueDataServer, :get_league_season_pairs)

    result
  end
end
