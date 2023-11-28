docker rm -f mydev

echo "The error code $?"

echo "Starting new container"

# This will mount the directory /tmp/junk say of user kalyanc on the host machine to /home/jboss/workspace in the container
# The files in the mounted directory can be read and written without any permission issues to type=bing in the mount
# If the type is not specified, the it will be read-only in the container

# docker run --name dev  --mount="type=bind,source=/tmp/junk,target=/home/jboss/workspace" -it dev-jdk17-node-20-lts:1.0  
echo "Echo will mount the local directory $HOME/mydev to: $HOME/mydev in the container"

docker run --name mydev -p 8080:8080 --mount="type=bind,source=$HOME/mydev,target=$HOME/mydev" -it mydev:1.0  
