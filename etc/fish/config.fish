function fish_title
    if [ (count $argv) -gt 0 ]
        echo "... $argv"
    else
        echo (basename (pwd))
    end
end

