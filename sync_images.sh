#!/bin/bash

set -e

# The directory where your obsidian vault's attachments are stored
OBSIDIAN_ATTACHMENTS_DIR="/home/sifat/Docuements/ob_vault/attachments"

# The directory in your git repo where you want to store the images
ASSETS_DIR="assets"

# Create the assets directory if it doesn't exist
mkdir -p "$ASSETS_DIR"

# Copy the images from the obsidian vault to the assets directory
# The -u flag ensures that we only copy new or updated files
cp -u -r "$OBSIDIAN_ATTACHMENTS_DIR"/* "$ASSETS_DIR/"

# For every markdown file in the current directory
for md_file in *.md; do
  # Replace the image paths in the markdown file
  sed -i 's|../attachments/|assets/|g' "$md_file"
done

echo "Image synchronization and link update complete."