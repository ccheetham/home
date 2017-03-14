#!/usr/bin/env zsh

cmd=$(basename $0)
source $(dirname $0)/profile

usage () {
    echo
    echo "  USAGE"
    echo
    echo "      $PROG $cmd [-h] NAME"
    echo
    echo "  DESCRIPTION"
    echo
    echo "      Run 'catalina.sh $cmd' for the specified Tomcat instance."
    echo
    echo "  OPTIONS"
    echo
    echo "      -h              display this message"
    echo
    echo "  WHERE"
    echo
    echo "      NAME            instance name"
    echo
}

while getopts ":h" opt
do
    case $opt in
        h)
            usage
            exit
            ;;
        :)
            err "-$OPTARG requires an argument"
            err "run with -h for help"
            exit 1
            ;;
        \?)
            err "invalid option -$OPTARG"
            err "run with -h for help"
            exit 1
            ;;
    esac
done
shift $(($OPTIND-1))

if [[ $# == 0 ]]
then
    die "NAME not specified; run with -h for help"
fi
name=$1
shift

if [[ $# > 0 ]]
then
    die "too many arguments; run with -h for help"
fi

instanceDir=$(instanceDirForName $name)

if [[ ! -d $instanceDir ]]
then
    die "instance $name does not exists; run '$PROG list' for a list of available instances"
fi

if [[ ! -f $instanceDir/version ]]
then
    die "cannot determin instance Tomcat version"
fi
version=$(cat $instanceDir/version)

distDir=$DIST_HOME/apache-tomcat-$version
if [[ ! -d $distDir ]]
then
    die "configured tomcat version $version is not available"
fi

export CATALINA_BASE=$instanceDir
$distDir/bin/catalina.sh $cmd

# vim: ft=zsh
