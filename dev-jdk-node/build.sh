echo "The current OS User is $USER"
echo "Will pass --build-arg DEV_USER=$USER"
echo "This will create a user called $USER in the container"
echo "We can then map a local user directory into the container without permission issues"

docker build --build-arg DEV_USER=$USER . -t mydev:1.0
