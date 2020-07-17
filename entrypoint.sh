#!/bin/sh -l

echo "Starts"
FOLDER="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
USER_EMAIL="$4"

echo "#### Get Python Version ####"
python --version

echo "#### Get Production Repo ####"
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git production

echo "git clone https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git production"

echo "#### Check Directory ####"
ls

echo "#### Cleaning Develop ####"
cd develop
rm -rf .git
rm -rf .github
cd ../

echo "#### Merging Code #####"
cp -r -u /develop/. /production/
 
cd production
git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA)"
git push origin master --force
