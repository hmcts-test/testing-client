#!/bin/bash

GENERATOR_VERSION=5.3.0
wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${GENERATOR_VERSION}/openapi-generator-cli-${GENERATOR_VERSION}.jar -O openapi-generator-cli.jar

BASE_PACKAGE=uk.gov.hmcts.petstore

java -jar openapi-generator-cli.jar generate \
-i https://petstore.swagger.io/v2/swagger.json \
--api-package $BASE_PACKAGE.api \
--model-package $BASE_PACKAGE.model \
--invoker-package $BASE_PACKAGE.invoker \
--group-id uk.gov.hmcts \
--artifact-id petstore \
--artifact-version 0.0.1 \
-g spring --library spring-cloud \
-o .

rm -rf openapi-generator-cli.jar pom.xml
