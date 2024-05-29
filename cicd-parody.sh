#!/usr/bin/env bash

DOCKER_IMAGE_NAME="nginx-app"
DOCKER_IMAGE_TAG="latest"
REMOTE_REGISTRY="ddovguchev1282"

HELM_RELEASE_NAME="nginx-app"
CHART_PATH="./helm/my-nginx-app"

docker build -t "$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG" ./docker

docker tag "$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG" "$REMOTE_REGISTRY/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"
docker push "$REMOTE_REGISTRY/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"

helm upgrade --install "$HELM_RELEASE_NAME" "$CHART_PATH"

# По хорошему нужно использовать уже готовые решения(gitlab-ci, jenkins), а не писать велосипед, в обычном pipeline, все разбивается по stag-ам,
# так же тут упущена stage docker login, и в cd части нету части для получения артифакта из удаленого репозитория
