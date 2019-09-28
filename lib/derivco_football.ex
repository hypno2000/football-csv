defmodule DerivcoFootball do
  @moduledoc """
  Documentation for DerivcoFootball.
  """

  def start(type, args) do    


    DerivcoFootball.Application.start(type, args)

    # IO.inspect :ets.all()
    # IO.inspect :ets.tab2list(String.to_existing_atom("E0_201617"))
    # IO.inspect :ets.tab2list(:ets_league_data_table_names)
    

  end
end
