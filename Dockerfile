FROM jenkins/jenkins:2.375.3

USER root

RUN apt-get update && \
    apt-get install -y lsb-release && \
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update &&\
    apt-get install -y docker-ce-cli

ENV CASC_JENKINS_CONFIG=${JENKINS_HOME}/jenkinsAsCode

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow configuration-as-code job-dsl git config-file-provider"
