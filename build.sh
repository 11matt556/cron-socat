# What base image of Alpine to use for all builds
current_alpine_version=1.7.4.4

# Build standard cron image
docker build --build-arg alpine_socat_version=$current_alpine_version --tag docker.io/11matt556/socat-cron:$current_alpine_version .
docker build --build-arg alpine_socat_version=$current_alpine_version --tag ghcr.io/11matt556/socat-cron:$current_alpine_version .

# Push images to Dockerhub
docker push ghcr.io/11matt556/socat-cron:$current_alpine_version
#docker push docker.io/11matt556/socat-cron:latest
#docker push docker.io/11matt556/socat-cron:$current_alpine_version
