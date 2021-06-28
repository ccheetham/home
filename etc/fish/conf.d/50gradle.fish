alias grr='gr --refresh-dependencies'

function gr
    if [ ! -f ./gradlew ]
        err ./gradlew not found
        return 1
    end
    echo % ./gradlew $argv
    ./gradlew $argv
end
