require 'sneakers'
require 'a9n'

A9n.set(:connection_options, { host: "localhost", port: 5672, vhost: "/", username: "guest", password: "guest"})

Sneakers.configure(
  connection: Bunny.new(A9n.connection_options),
  durable: false,
  workers: 1
)

