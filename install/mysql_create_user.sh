#!/bin/sh

USAGE="$0 host root_user root_password user_to_create user_to_create_password"

if [ "$#" -ne 5 ]; then
  echo "Usage:\n$USAGE"
  exit 1
fi

HOST=$1
ROOT_USER=$2
ROOT_PASSWORD=$3
NEW_USER=$4
NEW_PASSWORD=$5

mysql --host $HOST --user=$ROOT_USER --password=$ROOT_PASSWORD -A -e "set @user=$NEW_USER; set @password=$NEW_PASSWORD; source mysql_create_user.sql;"
