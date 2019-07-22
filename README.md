# Skex

## Overview
*Skex* is a NIF wrapper around Skein hashing functions.  It is a port of the Erlang Skerl library, by Basho.

   Hash a binary by calling *Skex.hash/2* with the desired number of
   bits for the resulting hash:

```elixir
iex> bits = 256
256
iex> data = "foobarbazquux"
<<"foobarbazquux">>
iex> {:ok, hash} = Skex.hash(bits, data)
{:ok,<<206,36,175,108,168,91,124,11,181,108,144,164,36,
      216,130,110,241,197,98,180,65,120,56,225,1,255,54,
      ...>>}
iex> bit_size(hash)
256
```

   You may find *Skex.hexhash/2* more useful, as it returns a
   hexadecimal-encoded string representing the hash:

```elixir
iex> hex_hash = Skex.hexhash(bits, data)      
<<"ce24af6ca85b7c0bb56c90a424d8826ef1c562b4417838e101ff3627dcc000bc">>
```

Documentation for this repo can be found [here](https://hexdocs.pm/skex/readme.html)


## Installation

The package can be installed by adding `skex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:skex, "~> 0.1.0"}
  ]
end
```

## The Skein Hash

The underlying hashing code in Skex is the reference implementation
of Skein from the official NIST submission.

Skein is a [finalist candidate in the NIST competition to become SHA-3](http://csrc.nist.gov/groups/ST/hash/sha-3/Round3/submissions_rnd3.html).

It is a hash function designed by 
Niels Ferguson, Stefan Lucks, Bruce Schneier, Doug Whiting, Mihir
Bellare, Tadayoshi Kohno, Jon Callas, and Jesse Walker.

Details on the algorithm as submitted and known analysis can be found
at [ecrypt](http://ehash.iaik.tugraz.at/wiki/Skein).

A [full paper on Skein](http://www.schneier.com/skein1.3.pdf)
by the designers has been published.

The [official Skein page](http://www.skein-hash.info/) uses the headline:

Fast, Secure, Simple, Flexible, Efficient. And it rhymes with "rain."

##Contributing

We encourage contributions to *Skex* from the community.

1) Fork the *Skex* repository on [Github](https://github.com/xirsys/skex).
2) Clone your fork or add the remote if you already have a clone of the repository.
```shell
git clone git@github.com:yourusername/skex.git
# or
git remote add mine git@github.com:yourusername/skex.git
```
3) Create a topic branch for your change.
```shell
git checkout -b some-topic-branch
```
4) Make your change and commit. Use a clear and descriptive commit message, spanning multiple lines if detailed explanation is needed.
5) Push to your fork of the repository and then send a pull-request through Github.
```shell
git push mine some-topic-branch
```
6) A Xirsys engineer or community maintainer will review your patch and merge it into the main repository or send you feedback.

