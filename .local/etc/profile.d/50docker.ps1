Set-Alias d docker

function drun
{
    & d run -it --rm $args
}

function dprune
{
    & d system prune -f
}

function dsh ($image, $shell="bash")
{
    & drun --entrypoint $shell $image
}
