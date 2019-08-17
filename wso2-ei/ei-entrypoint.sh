#!/bin/sh
#ei-entrypoint.sh
cp /home/wso2carbon/customizations/lib/* /home/wso2carbon/wso2ei-6.4.0/lib/
cp /home/wso2carbon/customizations/dropins/* /home/wso2carbon/wso2ei-6.4.0/dropins/
cp -R /home/wso2carbon/customizations/conf/* /home/wso2carbon/wso2ei-6.4.0/conf
/home/wso2carbon/init.sh