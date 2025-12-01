# Docker Hands-On – Basic Commands

## 1. Pulling an Image
docker pull nginx

## 2. Listing Images
docker images

## 3. Running a Container (Foreground Mode)
docker run nginx

## 4. Running a Container (Detached Mode)
docker run -d nginx

## 5. Listing Running Containers
docker ps

## 6. Listing All Containers (Running + Stopped)
docker ps -a

## 7. Stopping a Container
docker stop <container-id>

## 8. Removing a Container
docker rm <container-id>

## 9. Removing an Image
docker rmi <image-id>

## Notes:
- `docker run` = create + start container
- `-d` = detached mode (background)
- `docker pull` downloads image to local machine
- `docker stop` gracefully stops container
- `docker rm` removes container after stopping it