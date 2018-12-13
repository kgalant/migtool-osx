#!/bin/bash

MYDIR="$(dirname $0)"
DEFPACKAGEFILE=package.zip
PWDIR="$(pwd)"
PACKAGEBUILDER=/Users/kim.galant/dev/tools/PackageBuilder.jar

source $MYDIR/config.sh

print_usage()
{
	echo "usage: pb <propertyfile> [<parameter1>] [<parameter2>] [<parameter...>]"
}

#check if a known command is called

if [ -z "$1" ]; then
        print_usage;
        exit;
fi

# check if we got a property file as a second parameter

if [ -e "$1" ]; then
	PROPFILE=$1
elif [ -e "$PROPDIR/$1.properties" ]; then
	PROPFILE=$PROPDIR/$1.properties
else
	echo Couldnt find property file $1 or locate a $PROPDIR/$1.properties file, aborting...
	print_usage;
	exit;
fi

# now go off and do stuff

#echo 1: $1
#echo 2: $2
#echo 3: $3
#echo PROPFILE: $PROPFILE

if [ ! -z "$PROPFILE" ]; then
	java -jar $PACKAGEBUILDER -o $PROPFILE $*
fi


