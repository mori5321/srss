defmodule Srss.YamlParse do
  def load_project do
    path = File.cwd! |> Path.join("test.yaml")
    {:ok, data} = YamlElixir.read_from_file path 

    data = AtomicMap.convert(data, %{ignore: true})
    project = Map.merge(%Srss.Project{}, data[:project])
  end
end