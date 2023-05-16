# Liveview Cache

This is a **very experimental** project on how to achieve **client caching for LiveView**.

Still in an exploring phase for now, a proper Elixir library could come out of this at some point.

The demo displays a list of the most starred Github repositories, fetched from the Github GraphQL API.

## Next steps

- [x] fetch data from Github
- [ ] cache Github data on the client:
  - [ ] cache last socket state in local storage on client
  - [ ] send it as params on first socket connection
  - [ ] populate liveview assigns with params (during dead render)
- [ ] run benchmarks about loading performance
- [ ] extract an abstraction out of this (LiveView hook? JS hook? just functions?)
- [ ] package it as a proper Elixir library

## Setup

- install and setup dependencies: `mix setup`
- start Phoenix endpoint: `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Contributing

Contributions are welcome ✌️
