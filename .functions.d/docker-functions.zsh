#################################
# docker-images
#################################
function docker-images() {
    docker images | cut -d' ' -f1 | tail -n +2 | sort | uniq | xargs -L1 -I{} echo '"'{}'"'
}
