#!/usr/bin/env bash


docker login -u $DOCKER_USER -p $DOCKER_PASS

SHA1=$CIRCLE_SHA1

# Add latest tag and branch build number tag
docker tag $IMAGE_PATH:$CIRCLE_BUILD_NUM $IMAGE_PATH:${CIRCLE_BRANCH}_${CIRCLE_BUILD_NUM}
docker tag $IMAGE_PATH:$CIRCLE_BUILD_NUM $IMAGE_PATH:latest
docker tag $IMAGE_PATH:$CIRCLE_BUILD_NUM $IMAGE_PATH:latest_$CIRCLE_BRANCH

# Deploy image to Docker Hub
docker push $IMAGE_PATH:${CIRCLE_BRANCH}_${CIRCLE_BUILD_NUM}
docker push $IMAGE_PATH:latest
docker push $IMAGE_PATH:latest_$CIRCLE_BRANCH

