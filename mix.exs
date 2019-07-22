defmodule Skex.MixProject do
  use Mix.Project

  def project do
    [
      app: :skex,
      version: "0.1.1",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "NIF wrapper around Skein hashing functions.",
      source_url: "https://github.com/xirsys/skex",
      package: package(),
      docs: [
        extras: ["README.md"],
        main: "readme"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp package do
    %{
      files: ["lib", "mix.exs", "c_src", "README.md"],
      maintainers: ["Jahred Love"],
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/xirsys/skex"}
    }
  end
end
