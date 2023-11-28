1) For setting up dev environment with azoy-dev:1.0 container need to do the following

2) In the project root directory create a directory called .devcontainer
3) Copy the files devcontainer.json and Dockerfile to the directory .devcontainer
4) The Docker file has image reference to azoy-dev:1.0 
a) The container has aws java-17, maven 3.2.1 and node 16.0 
5) cd to project root directory
6) Start Microsoft Visual Studio in the project directory using command 
code .
7) The visual studio will detect the presence of .devcontainer folder and will use the devconatiner.json and Dockerfile in .devcontainer to build and launch a container
8) The project directory will be mounted in the container at /home/jboss/workspace
9) The maven repository in the project directory (on the host machine) can be created by running mvn command or can linked to existing ~/.m2/respository of host the machine
 using command:
ln -s $HOME/.m2/respository $PROJECT_DIR/repository
10) The /home/jboss/.m2/settings.xml (in the container) specifies the repository location as /home/jboss/workspace/repository (Using <localRepository>/home/jboss/workspaces/repository</localRepository> ). As mentioned in the previous point, the repository will be available in /home/jboss/worspace/repository

11) The container can be launced manually to play around with the commands in the container using the following:
docker run -it azoy:1.0

12) If the container is launched using visual studio, then we can get into the container using:
docker exec -it #ID /bin/bash

13) The 4200 port is exposed for Angular, 3000 for React JS, and 8080 for spring boot 
