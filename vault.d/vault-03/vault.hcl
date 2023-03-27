
disable_mlock=true

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}

storage "raft" {
  path = "/opt/vault/data"
  node_id = "raft_node_1"
}

cluster_addr="http://vault-03:8201"
api_addr="http://vault-03:8200"
