#!/bin/bash
DEBUG="true"
ENV="LIVE"
PORTAL_HELPDESK="www.partner-portal.com"
APIHOST="www.igs.com"
VAHOST="www.ums.com"

path="./config/config.template.ts"
newFilePath=${path/template./""}

echo ${newFilePath}

if [[ -e $newFilePath ]]; then
    rm -f $newFilePath
fi

cp -v $path $newFilePath

sed -i "s/<DEBUG>/${DEBUG}/g" $newFilePath
sed -i "s/<ENV>/${ENV}/g" $newFilePath
sed -i "s/<VAHOST>/${VAHOST}/g" $newFilePath
sed -i "s/<APIHOST>/${APIHOST}/g" $newFilePath
sed -i "s/<PORTAL_HELPDESK>/${PORTAL_HELPDESK}/g" $newFilePath