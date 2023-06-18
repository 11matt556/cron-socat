# What base image of Alpine to use for build
dev_alpine_socat_version=latest

if [ $# -eq 0 ];
then
echo "ERROR: No version provided."
exit -1
fi

docker build --build-arg alpine_socat_version=$dev_alpine_socat_version --tag 11matt556/socat-cron:dev .
