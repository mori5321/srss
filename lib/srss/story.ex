defmodule Srss.Story do
  defstruct [:title, :todos]

  alias Srss.Todo

  def story_estimate(story) do
    %{ 
      estimate: estimate_with_margin(story),
      normal: story_normal_time(story),
      margin: story_margin(story)
    }
  end

  def estimate_with_margin(story) do
    story_normal_time(story) + story_margin(story)
  end

  def story_normal_time(story) do
    story.todos
    |> Enum.map(fn todo -> todo.normal end)
    |> Enum.sum
  end

  def story_margin(story) do
    story.todos
    |> Todo.square_differences_from_todos
    |> Enum.sum
    |> :math.sqrt
    |> round
  end
end