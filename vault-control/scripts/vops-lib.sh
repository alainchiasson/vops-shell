## 
# 

vops_find_id() {
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

