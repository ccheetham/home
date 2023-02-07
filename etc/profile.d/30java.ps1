$Env:JDK19_HOME="C:\Tools\Java\jdk-19"
$Env:JDK17_HOME="C:\Tools\Java\jdk-17"
$Env:JDK11_HOME="C:\Tools\Java\jdk-11"
$Env:JDK7_HOME="C:\Tools\Java\jdk-7"
$Env:JDK8_HOME="C:\Tools\Java\jdk-8"
$Env:JDK6_HOME="C:\Tools\Java\jdk-6"

$Env:JDK_HOME="$Env:JDK11_HOME"
$Env:JAVA_HOME="$Env:JDK_HOME"

$ME_PATH = "$ME_PATH;$Env:JDK_HOME\bin"
