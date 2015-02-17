#################################
# boot2docker起動時initialize
#################################
if [ "`boot2docker status`" = "running" ]; then
    $(boot2docker shellinit)
fi
