Function k
{
    Invoke-Expression "kubectl $($Args -join " ")"
}

Function kk
{
    k config "$Args"
}
