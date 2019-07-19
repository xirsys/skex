defmodule Skex.Hex do
  def hex(n) when n < 10,
    do: ?0+n
  def hex(n) when n >= 10 and n < 16,
    do: ?a+(n-10)

  def int(c) when ?0 <= c and c <= ?9,
    do: c - ?0
  def int(c) when ?A <= c and c <= ?F,
    do: c - ?A + 10
  def int(c) when ?a <= c and c <= ?f,
    do: c - ?a + 10
      
  def to_hex(n) when n < 256,
    do: [hex(div(n, 16)), hex(rem(n, 16))]
   
  def list_to_hexstr([]),
    do: []
  def list_to_hexstr([h|t]),
    do: to_hex(h) ++ list_to_hexstr(t)

  def bin_to_hexstr(bin),
    do: list_to_hexstr(:erlang.binary_to_list(bin))

  def hexstr_to_bin(s),
    do: :erlang.list_to_binary(hexstr_to_list(s))

  def hexstr_to_list([x,y|t]),
    do: [int(x)*16 + int(y) | hexstr_to_list(t)]
  def hexstr_to_list([]),
    do: []
end