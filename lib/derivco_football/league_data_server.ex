defmodule DerivcoFootball.LeagueDataServer do
  @moduledoc """
  """

  use GenServer

  import DerivcoFootball.LeagueData
  
  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    {:ok, process_lines(Regex.split(~r/\n/, csvData()), MapSet.new())}
  end

  defp process_lines([], ets_table_names), do: {:ok, ets_table_names}
  
  defp process_lines([""|rest_of_lines], ets_table_names) do
    process_lines(rest_of_lines, ets_table_names)
  end
  
  defp process_lines([current_line|rest_of_lines], ets_table_names) do
    process_lines(rest_of_lines,
                  MapSet.put(ets_table_names,
                             insert_data(String.split(current_line, ","))))
  end

  defp insert_data([div, season, date, home_team, away_team, fthg, ftag, ftr, hthg, htag, htr]) do
    ets_table_name = "#{div}_#{season}"
    # This is a bit weird and non-elixirish...using the try/rescue
    # somewhat like control flow. The reason is that most of the
    # inserts will succeed and by rescuing on the argument error
    # for the small number of times it'll happen is faster and
    # cleaner than checking what ets tables exist every time
    # before the insert. It's also faster and cleaner than adding
    # another argument to keep track of them.
    try do      
      # converting string to atoms can be dangerous since the BEAM
      # has a fixed number of atoms available. however, this isn't
      # from external input nor a continuous process; the data comes
      # in once during initialization and the data is currently
      # hardcoded. if it were to cause a fault, we'd see it before
      # this system went online and could reconfigure the beam
      :ets.insert(String.to_atom(ets_table_name),
            { 
              {
                String.trim(date),
                String.trim(home_team),
                String.trim(away_team)
              },
              String.to_integer(fthg),
              String.to_integer(ftag),
              String.trim(ftr),
              String.to_integer(hthg),
              String.to_integer(htag),
              String.trim(htr)
            })
    rescue
      _e in ArgumentError -> 
        :ets.new(String.to_existing_atom(ets_table_name), [:named_table])
        :ets.insert(String.to_existing_atom(ets_table_name),
            { 
              {
                String.trim(date),
                String.trim(home_team),
                String.trim(away_team)
              },
              String.to_integer(fthg),
              String.to_integer(ftag),
              String.trim(ftr),
              String.to_integer(hthg),
              String.to_integer(htag),
              String.trim(htr)
            })      
    end
    ets_table_name
  end
end
