defmodule TodoWeb.TaskView do
  use TodoWeb, :view

  def count_tasks(completed, tasks) do
    tasks
      |> Enum.count(fn task -> task.completed == completed end)
  end

  def filter_tasks(params, tasks) do
    if !Map.has_key?(params, "completed") do
      tasks
    else
      completed = String.to_existing_atom(params["completed"])

      tasks
      |> Enum.filter(fn task -> task.completed == completed end)
    end
  end
end
