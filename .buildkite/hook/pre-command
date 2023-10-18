#!/bin/bash
# Set the GitHub repository URL
REPO_URL="https://api.github.com/repos/Ali-coder1996/pipeline/contents/"
echo $REPO_URL
# Use the GitHub API to list files in the repository
file_list=$(curl -s -H "Authorization: token $GITHUB_TOKEN" $REPO_URL)

# Loop through the list of files and download YAML files
for url in $(echo "$file_list" | jq -r '.[] | select(.name | endswith(".yaml")) | .download_url')
do
  filename=$(echo $url | awk -F'?' '{print $1}')
  echo "Downloading $filename"
  curl -O -L -H "Authorization: token $GITHUB_TOKEN" $filename
done
