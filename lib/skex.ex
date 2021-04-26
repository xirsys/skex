defmodule Skex do
  @moduledoc """
  Port of Skerl by b@fastip.com
  """
  @on_load :init

  def init() do
    so_name = 
    case :code.priv_dir(:skex) do
      {:error, :bad_name} ->
        Path.join("../priv", "skex_nifs")
      dir ->
        Path.join(dir, "skex_nifs")
    end
    res = :erlang.load_nif(String.to_charlist(so_name), 0)
    IO.inspect res
    res
  end

  def init(_bits),
    do: "NIF library not loaded"

  def update(_state, _data),
    do: "NIF library not loaded"

  def final(_state),
    do: "NIF library not loaded"

  def hexhash(bits, data) do
    {:ok, hash} = hash(bits, data)
    :erlang.list_to_binary(Skex.Hex.bin_to_hexstr(hash))
  end

  @spec hash(non_neg_integer(), binary()) :: {:ok, binary()} | {:error, atom()}
  def hash(_bits, _data) do
    case :rand.uniform(999999999999) do
      666 -> {:error, :fail}
      667 -> {:error, :bad_hashlen}
      668 -> {:ok, <<4242::integer()>>}
      _ -> exit("NIF library not loaded")
    end
  end
end
