defmodule Srss.Project do
  defstruct [:title, :stories]

  alias Srss.Story

  def project_estimate(project) do
    project.stories
    |> Enum.map(fn story -> Story.estimate_with_margin(story) end)
    |> Enum.sum
  end

  def estimate_with_detail(project) do
    project.stories
    |> Enum.map(fn story -> Srss.Story.story_estimate story end)
  end

  def project_normal_time(project) do
    project.stories
    |> Enum.map(fn story -> Story.story_normal_time(story) end)
    |> Enum.sum
  end

  def project_margin(project) do
    project.stories
    |> Enum.map(fn story -> Story.story_margin(story) end)
    |> Enum.sum
  end
end