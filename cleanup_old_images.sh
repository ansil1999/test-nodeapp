#!/bin/bash

# Number of latest images to keep
KEEP_LATEST=10

# Get the list of image IDs and creation dates, sort by date in ascending order (oldest first)
IMAGES_TO_DELETE=$(sudo docker images --format "{{.ID}} {{.CreatedAt}}" | sort -k 2 | head -n -${KEEP_LATEST} | awk '{print $1}')

# Loop through the images and delete each one
for IMAGE_ID in ${IMAGES_TO_DELETE}; do
    sudo docker rmi ${IMAGE_ID}
done
