# What base image of Alpine to use for all builds
current_alpine_version=$1

if [ $# -eq 0 ];
then
	current_alpine_version=latest
fi

# Build standard cron image
docker build --build-arg alpine_socat_version=$current_alpine_version --tag docker.io/11matt556/socat-cron:$current_alpine_version .
docker build --build-arg alpine_socat_version=$current_alpine_version --tag ghcr.io/11matt556/socat-cron:$current_alpine_version .
