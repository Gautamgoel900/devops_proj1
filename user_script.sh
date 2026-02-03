#!/bin/bash
### VARIABLES ###
GITHUB_REPO="https://github.com/Gautamgoel900/devops_proj1.git"
REPO_NAME=$(basename -s .git "$GITHUB_REPO")
APP_NAME="$REPO_NAME"
TOMCAT_VERSION="9.0.85"
TOMCAT_DIR="/opt/tomcat"

echo "Repo Name : $REPO_NAME"
echo "App Name  : $APP_NAME"
echo "===== STARTING EC2 SETUP ====="

### UPDATE SYSTEM ###
yum update -y

### INSTALL JAVA 8 + GIT + WGET ###
amazon-linux-extras enable java-openjdk8 || true
yum install -y java-1.8.0-openjdk git wget

java -version

### INSTALL TOMCAT ###
cd /tmp
wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

mkdir -p ${TOMCAT_DIR}
tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C ${TOMCAT_DIR} --strip-components=1
chmod +x ${TOMCAT_DIR}/bin/*.sh

### CLONE GITHUB REPO ###
cd /opt
rm -rf ${REPO_NAME}
git clone ${GITHUB_REPO}

### DEPLOY STATIC APP (WITH WEB-INF) ###
rm -rf ${TOMCAT_DIR}/webapps/${APP_NAME}
mkdir -p ${TOMCAT_DIR}/webapps/${APP_NAME}

cp -r /opt/${REPO_NAME}/* ${TOMCAT_DIR}/webapps/${APP_NAME}/

### START TOMCAT ###    
${TOMCAT_DIR}/bin/startup.sh

echo "===== SETUP COMPLETE ====="
