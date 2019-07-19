LDFLAGS = -lstdc++
SRC = c_src/*.c
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS = -g -O3 -Wall
CFLAGS += -I$(ERLANG_PATH)
CFLAGS += -fPIC
CFLAGS += -Ic_src

all:
	$(CC) $(CFLAGS) -shared $(LDFLAGS) $(SRC) -o priv/skex_nifs.so

