tenant_id       = "00000000-0000-0000-0000-000000000000"    # Use your own tenant_id, ...
subscription_id = "00000000-0000-0000-0000-000000000000"    # ... subscription_id, ...

client_id       = "00000000-0000-0000-0000-000000000000"    # ... client_id and ...
client_secret   = "client_secret"                           # ... client_secret.

user-types      = {
  operators       = {
    group           = "ops",
    users           = ["alice", "bob"]
  },
  admins          = {
    group           = "admin",
    users           = ["bob", "carol", "dave"]
  }
}
