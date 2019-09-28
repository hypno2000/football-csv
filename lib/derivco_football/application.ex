defmodule DerivcoFootball.Application do
  @moduledoc false

  alias DerivcoFootball.LeagueDataServer

  use Application

  def start(_type, _args) do
    children = [
      LeagueDataServer
    ]

    opts = [strategy: :one_for_one, name: DerivcoFootball.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
