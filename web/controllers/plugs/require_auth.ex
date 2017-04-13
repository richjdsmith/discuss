defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do #call params come from anything that happened in the init function. No init, no params
    if conn.assigns[:user] do
      #let them pass
      conn
    else
      #stop them.
      conn
        |> put_flash(:error, "You must be logged in for that.")
        |> redirect(to: Helpers.topic_path(conn, :index))
        |> halt()
    end


  end



end
