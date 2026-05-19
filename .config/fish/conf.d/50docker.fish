alias d='docker'
alias dh='d help'
alias dc='d compose'
alias dprune='d system prune -f'

# -----------------------------------------------------------------------------
# dman: convenience for 'man docker-CMD'
# -----------------------------------------------------------------------------
function dman
    if [ (count $argv) -ne 1 ]
        err "specify one and only one docker command"
        return 1
    end
    man docker-$argv[1]
end

# -----------------------------------------------------------------------------
# drun: run image interactively
# -----------------------------------------------------------------------------
function drun
    if [ (count $argv) -eq 0 ]
        set image (basename (pwd))
    else
        set image $argv[1]
        set -e argv[1]
    end
    docker run -it --rm $image $argv
end

# -----------------------------------------------------------------------------
# dbash: run image interactively via bash
# -----------------------------------------------------------------------------
function dbash
    if [ (count $argv) -ne 1 ]
        err "specify one and only one docker image"
        return 1
    end
    drun $image $argv[1] bash
end

# -----------------------------------------------------------------------------
# drmx: remove exited containers
# -----------------------------------------------------------------------------
function drmx
    docker ps --all --quiet --filter status=exited | xargs docker rm
end

# -----------------------------------------------------------------------------
# drmio: remove orphaned images
# -----------------------------------------------------------------------------
function drmio
    docker images | grep '^<none>' | awk '{print $3}' | xargs docker rmi
end

# -----------------------------------------------------------------------------
# dbuild: build image
# -----------------------------------------------------------------------------
function dbuild
    switch (count $argv)
        case 0
            set tag (basename (pwd))
        case 1
            set tag $argv[1]
        case *
            err "specify at most one tag"
            return 1
    end
    docker build -t $tag .
    msg "tagged as $tag"
end
