FROM bitwalker/alpine-elixir-phoenix:latest

RUN apk add --no-cache make build-base
RUN apk add --update --no-cache gcc

# Our working directory within the container
WORKDIR /opt/build

COPY . .

# CMD ["iex -S mix test"]

CMD ["/bin/sh"]