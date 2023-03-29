# Vault setup scripts

these scripts are meant to help manage mutliple vault environments.

# Security Warning

These commands are not yet complete and are very insecure at the moment. As I started, I found the getting the commands right is important.

A main goal is to use a seed vault to protect everything. For example : 

````
vault operator init -address=$VAULT_NEW -key-shares=1 -key-threshold=1 -format=json | vault kv put secret/vault init=-
````

Would store the init results in vault without intermediary (tmp file ?), while : 

````
for x in $(vault kv get -field=init secret/vault | jq -r '.unseal_keys_hex[]'  )
do
  vault operator unseal -address=$VAULT_NEW $x
done
````

Would do the same for getting results. 

# Test structure

Currently, this is embeded in a docker compose and docker to test managing multiple clusters. Additionally, it uses release 1.7.x as this was the last version of Enterprise vault with a time limited licence, great for testing. 

The usage is to start all containers, then exec into the shell image and run commands from there.

````
docker compose up
````

In a seperate console :

```
docker compose exec shell /bin/bash
```

# Reset and rebuild

The flow I am using when I need to make changes - either to reset the Vaults or rebuild the shell image, is to exit the container console and : 

```
# Rebuild the image 
# NOTE: rebuild will trigger a shell image replacement, and you loose the cluster information. While tedious, I prefer it to stale data.
docker compose build

# This will stop all vault images except seed, delete the data ( under ./data ), and start everything up again.
# If the shell image was rebuilt, it will be recreated.
./reset-new-vault

docker compose exec shell /bin/bash
```

# vops scripts

The commands should be run from the directory you exec into. Currently, there is no validation / testing. Mainly to get operations correct.

## VOPS Operations

vops-list

## Base commands

vops-init <vault>
vops-unseal <vault>
vops-status <vault>

## Root Token management

vops-gen-root-token <vault>
vops-gen-root-cancel <vault>

## DR Failover

The Faiover commands are the reason we are using the enterprise version.

vops-dr-link <dr-primary> <dr-secondary>
vops-dr-prom-sec <dr-primary> <dr-secondary>

## DR Operations Token

vops-dr-gen-ops-token <dr-primary> <dr-secondary>
