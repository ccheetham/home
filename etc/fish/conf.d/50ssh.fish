function instkey
    if [ (count $argv) -ne 1 ]
        err "Usage: $_ <host>"
        return
    end
    set user_host $argv[1]
    echo initializing remote keystore directory
    ssh $user_host mkdir -p .ssh
    echo copying public key
    scp ~/.ssh/id_rsa.pub $user_host:tmpkey
    echo installing public key
    ssh $user_host cat tmpkey '>>' .ssh/authorized_keys
    echo cleaning up
    ssh $user_host rm tmpkey
end
