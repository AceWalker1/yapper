defmodule Yapper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      YapperWeb.Telemetry,
      Yapper.Repo,
      {DNSCluster, query: Application.get_env(:yapper, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Yapper.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Yapper.Finch},
      # Start a worker by calling: Yapper.Worker.start_link(arg)
      # {Yapper.Worker, arg},
      # Start to serve requests, typically the last entry
      YapperWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yapper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YapperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
