seal "transit" {
  address         = "http://vault-01:8200"
  token           = "hvs.CAESIANOIktTk_qwVAzUiHCr-Y5ND-DquzwCy05fnQnqY-knGh4KHGh2cy5Fa2M1bzhRUzR3OGtJOTVtejNHclhlNEg"
  disable_renewal = "false"
  key_name        = "autounseal"
  mount_path      = "transit/"
  tls_skip_verify = "true"
}
