ARM_PATH=/opt/FriendlyARM/toolschain/4.5.1
if ! echo $PATH | /bin/grep -q $ARM_PATH/bin ;
then
    PATH=$ARM_PATH/bin:$PATH
    export PATH
fi
