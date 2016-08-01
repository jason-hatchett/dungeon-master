defmodule Dungeonmaster do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    
    slack_token = Application.get_env(:dungeonmaster, Dungeonmaster.Slack)[:token]

    children = [
      worker(Dungeonmaster.Slack, [slack_token, :whatever])
    ]

    opts = [strategy: :one_for_one, name: Dungeonmaster.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
