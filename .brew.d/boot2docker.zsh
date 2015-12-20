#################################
# boot2docker起動時initialize
#################################
if [ "`docker-machine start default`" = 'Machine "default" is already running.' ]; then
    eval "$(docker-machine env default)"
fi
