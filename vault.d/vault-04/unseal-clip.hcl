seal "transit" {
  address         = "http://vault-02:8200"
  token           = "hvs.CAESILxq8qInsEwcRxNrCZ4P4iAheVuDShpv8furixc6WTB8Gh4KHGh2cy5qZHN0YlBEN1BkNVNjUDJCV3E4cVJWQ0E"
  disable_renewal = "false"
  key_name        = "autounseal"
  mount_path      = "transit/"
  tls_skip_verify = "true"
}
