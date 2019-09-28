defmodule DerivcoFootball do
  @moduledoc """
  Documentation for DerivcoFootball.
  """

  import DerivcoFootball.LeagueDataLoader

  def start(type, args) do    

    load_league_data()
    
    # IO.inspect :ets.all()
    # IO.inspect :ets.tab2list(String.to_existing_atom("E0_201617"))
    # IO.inspect :ets.tab2list(:ets_league_data_table_names)
    
    #    DerivcoFootball.Application.start(type, args)
  end
end
