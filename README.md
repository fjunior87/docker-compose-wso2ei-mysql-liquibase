# Description

Docker compose configuration to have an environment with:
* WSO2 EI 6.4.0
* MySQL 5.7.19
* Sample Liquibase

This project was inspired by those:
* [Docker-Compose-Nginx-Php-Mysql](https://github.com/danielnogueira-dev/Docker-Compose-Nginx-Php-Mysql)
* [Liquibase migration with Docker containers](http://mr0ger-arduino.blogspot.com/2018/07/liquibase-migration-with-docker.html)


# WSO2 EI Container Configuration 

This is a WSO2 EI 6.4.0 container. The only customization is the MySQL Datasource configuration that can be found at:

	wso2-ei/customizations/conf/datasources/my-datasources.xml

It is able to connect with MySQL using a container link.

1. Exposed Ports

	9443, 8280 and 8243

2. Volume 

	Carbonapps: wso2-ei/carbonapps -> /home/wso2carbon/wso2ei-6.4.0/repository/deployment/server/carbonapps
	
	Custom Entrypoint: wso2-ei/ei-entrypoint.sh -> /home/wso2carbon/ei-entrypoint.sh
	
	Customizations(conf,lib,dropins): wso2-ei/customizations -> /home/wso2carbon/customizations
	
	The customizations folder will be used when needed to add a custom configuration file, e.g axis2.xml, or lib or dropins. The custom entrypoint script(ei-entrypoint.sh) will copy the custom files to the target folders in the ei installation inside the container.

	If a custom carbon.xml is needed, we just need to place it under the customizations/conf folder, if the axis2.xml is needed, we need to place it under customizations/conf/axis2 folder.


# Liquibase Container Configuration

This is a container that has a liquibase project to create a table in MySQL Container.
	
	
# MySQL Container Configuration

1. Exposed Ports

	3306

2. Volume 

	Application: mysql/data -> /var/lib/mysql

3. Configurations to create a connection

	- MYSQL_DATABASE      = default
	
    - MYSQL_USER          = default
	
    - MYSQL_PASSWORD      = secret
	
    - MYSQL_ROOT_PASSWORD = root
	
    - MYSQL_PORT          = 3306
	
# How To Use it

1. Clone the repo:

   git clone https://github.com/fjunior87/docker-compose-wso2ei-mysql-liquibase.git

2. Go to the folder docker-compose-wso2ei-mysql-liquibase and copy the file example-env to .env.

   cp example-env .env

3. Run the containers:

   docker-compose up -d

4. Abra no navegador

   https://localhost:9443/carbon

It is also possible to connect to the MySQL container using a client like MySQL Workbench using localhost:3306.
