#!/bin/bash

PROPDIR=$MYDIR/properties
SAXON=$MYDIR/saxon9he.jar

read_properties()
{
  file="$1"
  while IFS="=" read -r key value; do
    case "$key" in
      '#'*) ;;
      *)
        eval "$key=\"$value\""
    esac
  done < "$file"
}