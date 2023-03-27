seal "transit" {
  address         = "http://vault-01:8200"
  token           = "hvs.CAESIAm_QOLDZPhozULXLLQJDpLd8ISCKXZOo5KYfFfGQWQBGh4KHGh2cy42MDBPVWdyak5GRkpheHM4MUVsNXJxMDI"
  disable_renewal = "false"
  key_name        = "autounseal"
  mount_path      = "transit/"
  tls_skip_verify = "true"
}
