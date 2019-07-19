# Skex

## Overview
=Skex= is a NIF wrapper around Skein hashing functions.  It is a port of the Erlang Skerl library, by Basho.

   Hash a binary by calling =Skex.hash/2= with the desired number of
   bits for the resulting hash:

#+BEGIN_SRC elixir
1> bits = 256
256
2> data = "foobarbazquux"
<<"foobarbazquux">>
3> {:ok, hash} = Skex.hash(bits, data)
{:ok,<<206,36,175,108,168,91,124,11,181,108,144,164,36,
      216,130,110,241,197,98,180,65,120,56,225,1,255,54,
      ...>>}
4> bit_size(hash)
256
#+END_SRC

   You may find =Skex.hexhash/2= more useful, as it returns a
   hexadecimal-encoded string representing the hash:

#+BEGIN_SRC erlang
5> hex_hash = Skex.hexhash(bits, data)      
<<"ce24af6ca85b7c0bb56c90a424d8826ef1c562b4417838e101ff3627dcc000bc">>
#+END_SRC


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed by adding `skex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:skex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) and published on [HexDocs](https://hexdocs.pm). Once published, the docs can be found at [https://hexdocs.pm/skex](https://hexdocs.pm/skex).


## The Skein Hash

The underlying hashing code in Skex is the reference implementation
of Skein from the official NIST submission.

Skein is a [[http://csrc.nist.gov/groups/ST/hash/sha-3/Round3/submissions_rnd3.html][finalist candidate in the NIST competition to become SHA-3]].

It is a hash function designed by 
Niels Ferguson, Stefan Lucks, Bruce Schneier, Doug Whiting, Mihir
Bellare, Tadayoshi Kohno, Jon Callas, and Jesse Walker.

Details on the algorithm as submitted and known analysis can be found
at [[http://ehash.iaik.tugraz.at/wiki/Skein][ecrypt]].

A [[http://www.schneier.com/skein1.3.pdf][full paper on Skein]]
by the designers has been published.

The [[http://www.skein-hash.info/][official Skein page]] uses the headline:

Fast, Secure, Simple, Flexible, Efficient. And it rhymes with "rain."

** Contributing
   We encourage contributions to =skex= from the community.

   1) Fork the =Skex= repository on [[https://github.com/xirsys/skex][Github]].
   2) Clone your fork or add the remote if you already have a clone of
      the repository.
#+BEGIN_SRC shell
git clone git@github.com:yourusername/skex.git
# or
git remote add mine git@github.com:yourusername/skex.git
#+END_SRC
   3) Create a topic branch for your change.
#+BEGIN_SRC shell
git checkout -b some-topic-branch
#+END_SRC
   4) Make your change and commit. Use a clear and descriptive commit
      message, spanning multiple lines if detailed explanation is
      needed.
   5) Push to your fork of the repository and then send a pull-request
      through Github.
#+BEGIN_SRC shell
git push mine some-topic-branch
#+END_SRC
   6) A Xirsys engineer or community maintainer will review your patch
      and merge it into the main repository or send you feedback.

