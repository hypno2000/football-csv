defmodule DerivcoFootball.LeagueDataServer do
  @moduledoc """
  This a rather simple GenServer that processes the league/season
  data into ETS tables for later retrieval via to message call
  handlers. The messages are:

  - get_league_season_pairs
  - get_league_season_results

  These are called by the HTTP API handlers.

  The data processing is handled by recursively processing the
  csv lines, provided by DerivcoFootball.LeagueData.csvData',
  via the 'process_lines' functions. There are some assumptions
  made about the data; from the DerivcoFootballTest @moduledoc:

  'As the data is coming in from external systems,
  we're going to make the assumption that the data
  has been validated before it's been made avalible.
  If this weren't the case, we'd have to deal with
  data validation bleeding across all system/service
  boundaries. This makes error handling and testing
  much more complicated and breaks encapsulation.'

  With regard to data organization in the ETS tables, they're
  organized into separate results tables for each league/-season
  pair. This allows us to avoid having to query for the data we
  need when a request comes in; i.e., a results requests is for
  all the results for a specific league/season pair. The tables
  are also named by league/season pair. This way it's a simple
  matter of returning all the results from the appropriate table.

  NB: the league/season pairs, which are also the table names,
  aren't stored in ETS. They're saved in a MapSet during the
  recursive line processing and then returned to the 'init'
  callback to be saved as port of the GenServer state.

  There isn't a lot of defensive handling here. If something goes
  wrong, it's some sort of rare, unforseen, and/or catastrophic
  error since this part of the initialization process. This practice
  is idiomatic in Elixir/Erlang/OTP practice.
  """

  use GenServer

  import DerivcoFootball.LeagueData

  #
  # GenServer Callbacks
  #
  
  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    {:ok, process_lines(Regex.split(~r/\n/, csvData()), MapSet.new())}
  end

  #
  # External Call Handlers
  #
  
  @doc """
  This returns the league/season pairs that are used as keys
  for calls to 'get_league_season_results'. It's used by:
  - 'handle_get_json_league_season_pairs'
  - 'handle_protobuf_get_league_season_pairs'
  """
  def handle_call(:get_league_season_pairs, _from, state) do
    {:reply, {:ok, state}, state}
  end

  @doc """
  This returns the league/season pair results. It's used by:
  - 'handle_json_get_league_season_results'
  - 'handle_protobuf_get_league_season_results'
  """
  def handle_call({:get_league_season_results, league_season_pair}, _from, state) do
    if MapSet.member?(state, league_season_pair) do
      {:reply, {:ok, :ets.tab2list(String.to_existing_atom(league_season_pair))}, state}
    else
      {:reply, {:error, :bad_league_season_pair}, state}
    end
  end

  #
  # Internal Functions
  #

  # This is the function to stop the recursive process. It also
  # returns the 'ets_table_names' MapSet to the 'init' function
  # so it can be saved as part of the GenServer state.
  defp process_lines([], ets_table_names), do: ets_table_names

  # The csv data is stored in a @doc string. As such, it contains
  # a blank line at the end. We have to avoid processing that line
  # so we pattern match on it and trap it in this auxilliary
  # recursive function.
  defp process_lines(["" | rest_of_lines], ets_table_names) do
    process_lines(rest_of_lines, ets_table_names)
  end

  # Primary recursive line processing function. All the actual
  # work is done here. 'ets_table_names' is passed each time to
  # keep track of the league/season pairs that are used as the
  # table names.
  defp process_lines([current_line | rest_of_lines], ets_table_names) do
    process_lines(
      rest_of_lines,
      MapSet.put(
        ets_table_names,
        insert_data(String.split(current_line, ","))
      )
    )
  end

  # We use a separate function to destructure the data with a pattern
  # match. We create the table name from the league (aka 'div') and
  # the season since these make a "primary key" for the results. This
  # function is a bit weird looking and uses a non-standard technique.
  # Read the large comments below for details.
  #
  # Comments reproduced here for generated docs:
  #
  # Regarding the use of try/rescue in a somewhat flow control fashion:
  #    This is a bit weird and non-elixirish...using the try/rescue
  #    somewhat like control flow. The reason is that most of the
  #    inserts will succeed and by rescuing on the argument error
  #    for the small number of times it'll happen is faster and
  #    cleaner than checking what ets tables exist every time
  #    before the insert. It's also faster and cleaner than adding
  #    another argument to keep track of them.
  #
  # Regarding the creation of atoms, for the ets table names,
  # at runtime:
  #    converting string to atoms can be dangerous since the BEAM
  #    has a fixed number of atoms available. however, this isn't
  #    from external input nor a continuous process; the data comes
  #    in once during initialization and the data is currently
  #    hardcoded. if it were to cause a fault, we'd see it before
  #    this system went online and could reconfigure the beam
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
      :ets.insert(
        String.to_atom(ets_table_name),
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
        }
      )
    rescue
      _e in ArgumentError ->
        :ets.new(String.to_existing_atom(ets_table_name), [:named_table])

        :ets.insert(
          String.to_existing_atom(ets_table_name),
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
          }
        )
    end

    ets_table_name
  end
end
