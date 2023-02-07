docker rm -f azoy-dev

echo "The error code $?"

echo "Starting new container"

# This will mount the directory /tmp/junk say of user kalyanc on the host machine to /home/jboss/workspace in the container
# The files in the mounted directory can be read and written without any permission issues to type=bing in the mount
# If the type is not specified, the it will be read-only in the container

docker run --name azoy-dev  --mount="type=bind,source=/tmp/junk,target=/home/jboss/workspace" -it azoy-dev:1.0  
