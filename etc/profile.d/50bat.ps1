if (Get-Command "bat" -ErrorAction SilentlyContinue)
{
    Function cat($path) {
        bat -P "$path"
    }
}
