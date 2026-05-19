function t
    if [ (count $argv) -eq 0 ]
        clear
        task
    else
        task $argv
    end
end
