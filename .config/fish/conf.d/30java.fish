alias j='java'
alias j8='$JDK8_HOME/bin/java'
alias j11='$JDK11_HOME/bin/java'
alias j15='$JDK15_HOME/bin/java'

function jversions
    for jname in JDK JDK6 JDK7 JDK8 JDK11 JDK15
        eval set jhome '$'$jname'_HOME'
        if [ -n "$jhome" ]
            set jcmd $jhome/bin/java
            if [ -x "$jcmd" ]
                set jinfo ("$jhome/bin/java" -version 2>&1 | head -1 | sed 's/[^"]*"\([^"]*\).*/\1/')
            else
                set jinfo '<not installed>'
            end
        else
            set jinfo '<not defined>'
        end
        printf "%-16s %-16s %s\n" "$jname" "$jinfo" "$jhome"
    end
end
