FROM ubuntu:latest

#Errors can be prevented by setting the DEBIAN_FRONTEND environment variable to noninteractive
RUN DEBIAN_FRONTEND=noninteractive

# Before any packages can be installed, you need to update the package list by calling
RUN apt update

SHELL ["/bin/bash", "-c"]

# Add sudo command to the image
RUN apt install sudo

RUN apt install -y less
RUN apt install -y vim
RUN apt install -y git
RUN apt install -y wget
RUN apt install -y curl
RUN apt install -y net-tools
RUN apt install -y telnet

# Install JVM
RUN apt-get update
RUN apt install -y software-properties-common
RUN apt-get install -y gnupg2
RUN wget -O /tmp/corretto.key  https://apt.corretto.aws/corretto.key 
RUN apt-key add /tmp/corretto.key
RUN add-apt-repository 'deb https://apt.corretto.aws stable main'
RUN apt-get install -y java-17-amazon-corretto-jdk

# Install Maven
ARG MVN_URL=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.2.1/apache-maven-3.2.1-bin.tar.gz  
RUN mkdir -p /opt/maven \
 && curl -fsSL -o /tmp/apache-maven.tar.gz ${MVN_URL} \
 && tar -xzf /tmp/apache-maven.tar.gz -C /opt/maven --strip-components=1 \
 && rm -f /tmp/apache-maven.tar.gz 
RUN ln -s /opt/maven/bin/mvn /usr/bin/mvn

ARG DEV_USER

# Add $DEV_USER user
RUN useradd $DEV_USER && echo "$DEV_USER:$DEV_USER" | chpasswd
RUN mkdir -p /home/$DEV_USER && chown -R $DEV_USER:$DEV_USER /home/$DEV_USER
# Add $DEV_USER to sudo group
RUN usermod -aG sudo $DEV_USER

#customize in $DEV_USER user
USER $DEV_USER

ENV M2_HOME /opt/maven
RUN mkdir -p /home/$DEV_USER/.m2
ADD settings.xml /home/$DEV_USER/.m2/settings.xml

RUN echo "Customizing /home/$DEV_USER/.bashrc ...."
RUN echo "PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '" >> /home/$DEV_USER/.bashrc
RUN echo "alias l='ls -ltr'" >> /home/$DEV_USER/.bashrc

ADD node-install.sh /home/$DEV_USER/node-install.sh

RUN echo "Will install node for $DEV_USER user"
ENV NVM_DIR /home/$DEV_USER/.nvm
ENV NODE_VERSION 20

# For some reason the curl is not able to download at home.
# RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh -o /tmp/node-install.sh

# Try copying the existing file and install with that
ADD node-install.sh /tmp/node-install.sh

RUN cat /home/$DEV_USER/node-install.sh | bash \
 &&   echo yarn > $NVM_DIR/default-packages \
 && . $NVM_DIR/nvm.sh \
 && nvm install $NODE_VERSION \
 && nvm use $NODE_VERSION \
 &&   echo yarn > $NVM_DIR/default-packages \
 && . $NVM_DIR/nvm.sh \
 && nvm install $NODE_VERSION \
 && nvm use $NODE_VERSION


# For angular
EXPOSE 4200
# For reactjs
EXPOSE 3000
# For spring bood
EXPOSE 8080

WORKDIR /home/$DEV_USER

CMD /bin/bash
