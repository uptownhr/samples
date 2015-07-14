#!/bin/bash                                                                                                                                              

# Make GPG explicitly aware of our private key,                                                                                                          
# since we'll be running this via cron as root                                                                                                           
HOME="/home/jae"
export HOME=$HOME

# Load our credentials                                                                                                                                   
source "$HOME/.duplicity/.credentials.conf"

export PASSPHRASE
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY

duplicity \
    --verbosity debug \
    --s3-use-new-style \
    --full-if-older-than 7D \
    --asynchronous-upload \
    --volsize=100 \
    --log-file "$HOME/.duplicity/notice.log" \
    "$HOME/test" \
    s3+http://procbackup/

unset PASSPHRASE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
