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

RUN apt-get update	

RUN apt install -y tesseract-ocr
RUN apt install -y tesseract-ocr-tel
RUN apt install -y libtesseract-dev

#Add jboss user
RUN useradd jboss && echo "jboss:jboss" | chpasswd
RUN mkdir -p /home/jboss && chown -R jboss:jboss /home/jboss

#Add jboss to sudo group
RUN usermod -aG sudo jboss

# start as jboss user in the container
USER jboss

RUN echo "Customizing /home/jboss/.bashrc ...."
RUN echo "PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '" >> /home/jboss/.bashrc
RUN echo "alias l='ls -ltr'" >> /home/jboss/.bashrc
RUN cd /home/jboss

EXPOSE 4200

CMD /bin/bash
