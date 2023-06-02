$Env:GRADLE_HOME="$Env:ME_TOOL_DIR\opt\gradle"
$Env:GRADLE_USER_HOME="$Env:ME\.gradle"
$Env:GRADLE_OPTS="-Dorg.gradle.daemon=false -Dorg.gradle.console=rich"

Set-Alias gr .\gradlew.bat
Function grr { gr --refresh-dependencies $Args }
