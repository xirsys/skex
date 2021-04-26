defmodule SkexTest do
  use ExUnit.Case
  alias Skex

  test "eight bit input" do
    res = '42AA6BD9CA92E90EA28DF6F6F2D0D9B85A2D1907EE4DC1B171ACE7EB1159BE3BD1BC56586D92492B6EFF9BE03306994C65A332C4C24160F46655040E558E8329'
    |> Skex.Hex.hexstr_to_bin()
    assert {:ok, ^res} = Skex.hash(512, <<255>>)
  end

  test "fivetwelve bit input" do
    res1 = '04F96C6F61B3E237A4FA7755EE4ACF34494222968954F495AD147A1A715F7A73EBECFA1EF275BED87DC60BD1A0BC602106FA98F8E7237BD1AC0958E76D306678'
    |> Skex.Hex.hexstr_to_bin()
    res2 = 'FFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0DFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0'
    |> Skex.Hex.hexstr_to_bin()
    assert {:ok, ^res1} = Skex.hash(512, res2)
  end
        
  test "streaming input" do
    assert {:ok, s} = Skex.init(512)
    assert {:ok, _} = Skex.update(s, Skex.Hex.hexstr_to_bin('FFFEFDFCFBFAF9F8'))
    assert {:ok, _} = Skex.update(s, Skex.Hex.hexstr_to_bin('F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1'))
    assert {:ok, _} = Skex.update(s, Skex.Hex.hexstr_to_bin('E0DFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9'))
    assert {:ok, _} = Skex.update(s, Skex.Hex.hexstr_to_bin('C8C7C6C5C4C3C2C1C0'))
    res = '04F96C6F61B3E237A4FA7755EE4ACF34494222968954F495AD147A1A715F7A73EBECFA1EF275BED87DC60BD1A0BC602106FA98F8E7237BD1AC0958E76D306678'
    |> Skex.Hex.hexstr_to_bin()
    assert {:ok, ^res} = Skex.final(s)
  end
end
