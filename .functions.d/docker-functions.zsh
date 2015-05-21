#################################
# docker-images
#################################
function docker-images() {
    docker images | cut -d' ' -f1 | tail -n +2 | sort | uniq | xargs -L1 -I{} echo '"'{}'"'
}

#################################
# digitalocean-docker-machine
#################################

function digitalocean-docker-machine() {
    TOKEN=${1:-$DIGITALOCEAN_ACCESS_TOKEN}
    if [ -z "$TOKEN" ]; then
       echo "TOKENが設定されていません。"
       return 1;
    fi
    SIZE=${2:-'512mb'}
    docker-machine create --driver digitalocean --digitalocean-access-token $TOKEN --digitalocean-region sgp1 --digitalocean-size $SIZE dev
}
