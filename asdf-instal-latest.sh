#!/usr/bin/env bash

# Fetch all the plugins managed by asdf
plugins=$(asdf plugin list)

# Loop through each plugin and install the latest version
for plugin in $plugins; do
  # Fetch the latest version for the plugin
  latest_version=$(asdf list-all $plugin | tail -1 | tr -d ' ')

  # Check if we successfully fetched a version
  if [[ ! -z "$latest_version" ]]; then
    echo "Installing latest version ($latest_version) of $plugin..."
    asdf install $plugin $latest_version
  else
    echo "Could not fetch latest version for $plugin. Skipping..."
  fi
done

echo "Installation complete!"
