FROM maven:3-jdk-8-alpine

LABEL MANTEINER="Francisco Ribeiro(fjunior87@gmail.com)"

ENV LIQUIBASE_PROJECT_DIR=${LIQUIBASE_PROJECT_DIR:-.}\
    LIQUIBASE_DATABASE_DRIVER=${LIQUIBASE_DATABASE_DRIVER:-com.mysql.cj.jdbc.Driver}\
    LIQUIBASE_DATABASE_URL=${LIQUIBASE_DATABASE_URL:-jdbc:mysql://localhost:3306/default}\
    LIQUIBASE_DATABASE_USERNAME=${LIQUIBASE_DATABASE_USERNAME:-root}\
    LIQUIBASE_DATABASE_PASSWORD=${LIQUIBASE_DATABASE_PASSWORD:-root}


ADD ${LIQUIBASE_PROJECT_DIR} /usr/local/alpine-jdk8-liquibase

WORKDIR /usr/local/alpine-jdk8-liquibase
CMD mvn liquibase:update -Dliquibase.driver=${LIQUIBASE_DATABASE_DRIVER} -Dliquibase.url=${LIQUIBASE_DATABASE_URL} -Dliquibase.username=${LIQUIBASE_DATABASE_USERNAME} -Dliquibase.password=${LIQUIBASE_DATABASE_PASSWORD} -Dliquibase.changeLogFile=src/main/resources/dbchangelog/changelog.xml -Dliquibase.verbose=true

