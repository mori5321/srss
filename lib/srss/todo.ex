defmodule Srss.Todo do
  defstruct [:title, :normal, :max]

  def square_differences_from_todos(todos) do
    todos
    |> Enum.map(fn todo -> square_difference(todo) end)
  end

  def square_difference(todo) do
    todo
    |> difference
    |> square
  end

  defp difference(todo) do
    todo.max - todo.normal
  end

  defp square(int) do
    int * int
  end
end