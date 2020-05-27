#!/bin/bash

git checkout master
git pull --rebase
git checkout -b ${VERSION}
sed -r -i "s@(.*)ANGULAR_CLI_VERSION=.*@\1ANGULAR_CLI_VERSION=${VERSION}@g" Dockerfile*
git commit -a -m "update to ${VERSION}"
git checkout master
sed -r -i "s@(.*)ANGULAR_CLI_VERSION=.*@\1ANGULAR_CLI_VERSION=${VERSION}@g" Dockerfile*
git commit -a -m "update to ${VERSION}"
git push -u origin ${VERSION}
cd ..

echo "Waiting for build docker-ng-cli"
sleep 10m
echo "Build should be done"

cd docker-ng-cli-karma
git checkout master
git pull --rebase
git checkout -b ${VERSION}
sed -i -r "s@(.*)zaflun/ng-cli:.*@\1zaflun/ng-cli:${VERSION}@g" Dockerfile
git commit -a -m "update to ${VERSION}"
git checkout master
sed -i -r "s@(.*)zaflun/ng-cli:.*@\1zaflun/ng-cli:${VERSION}@g" Dockerfile
git commit -a -m "update to ${VERSION}"
git push -u origin ${VERSION}
cd ..

echo "Waiting for build docker-ng-cli-karma"
sleep 13m
echo "Build should be done"

cd docker-ng-cli-e2e
git checkout master
git pull --rebase
git checkout -b ${VERSION}
sed -i -r "s@(.*)zaflun/ng-cli-karma:.*@\1zaflun/ng-cli-karma:${VERSION}@g" Dockerfile
git commit -a -m "update to ${VERSION}"
git checkout master
sed -i -r "s@(.*)zaflun/ng-cli-karma:.*@\1zaflun/ng-cli-karma:${VERSION}@g" Dockerfile
git commit -a -m "update to ${VERSION}"
git push -u origin ${VERSION}
cd ..

echo "Pushing latest..."
cd docker-ng-cli
git push --all
cd ..
cd docker-ng-cli-karma
git push --all
cd ..
cd docker-ng-cli-e2e
git push --all
cd ..