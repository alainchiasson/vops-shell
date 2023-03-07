## 
# 

vops_find_id() {
    echo 0
}

# [root@b9ec86b73caf workdir]# yq --arg CNAME "$cname"  '.Cluster | map(.Name == $CNAME ) | index(true)' vops.yaml

vops_id_by_name() {
    cname=$1
    yq --arg CNAME "$cname" '.Cluster | map(.Name == $CNAME) | index(true)' vops.yaml
}

vops_default_id() {
    echo 0
}

vops_clusters() {
    yq -r  ".Cluster[].Name" vops.yaml
}

cluster_name() {
    ID=${1:-0}
    yq -r  ".Cluster[$ID].Name" vops.yaml
}

cluster_addr() {
    ID=${1:-0}
    yq -r ".Cluster[$ID].Addr" vops.yaml
}

key_shares() {
    ID=${1:-0}
    yq -r ".Cluster[$ID].Keys.Shares" vops.yaml
}

key_threshold() {
    ID=${1:-0}
    yq -r ".Cluster[$ID].Keys.Threshold" vops.yaml
}

key_path() {
    ID=${1:-0}
    yq -r ".Cluster[$ID].Keys.Path" vops.yaml
}

get_root() {
    ID=${1:-0}
    KEY_PATH=$(key_path $ID)
    jq -r '.root_token' $KEY_PATH/init.json 
}