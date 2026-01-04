detect_arch ()
{
  # Run the lscpu command and convert the output to lowercase
  lscpu_output=$(lscpu | tr '[:upper:]' '[:lower:]')

  # Check if the output contains the string "aarch64"
  if [[ $lscpu_output = *"aarch64"* ]]; then
    # If it does, output "arm64"
    echo "arm64"
  else
    # If it doesn't, output "x86_64"
    echo "x86"
  fi
}

detect_os ()
{
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$ID"
  elif [ -f /etc/redhat-release ]; then
    echo "fedora"
  else
    echo "unknown"
  fi
}

detect_pkg_manager ()
{
  OS=$(detect_os)
  case "$OS" in
    ubuntu|debian)
      echo "apt"
      ;;
    fedora|rhel|centos)
      echo "dnf"
      ;;
    *)
      echo "unknown"
      ;;
  esac
}

#!/usr/bin/env bash

# Set the target GitHub repository (format: "owner/repo")
download_latest_release () {
  REPO=$1
  # Check if the REPO variable is set
  if [[ -z "$REPO" ]]; then
    echo "Please set the REPO variable to the target repository, e.g., 'owner/repo'"
    exit 1
  fi

  # Fetch the latest release version from GitHub API
  latest_version=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep -oP '"tag_name": "\K(.*)(?=")')

  # Check if the latest_version was successfully retrieved
  if [[ -z "$latest_version" ]]; then
    echo "Unable to fetch the latest version for ${REPO}. Please ensure the repository name is correct."
    exit 1
  fi

  # Remove the 'v' prefix from the version number if it exists
  version=${latest_version#v}

  # Construct the download URL
  # Note: This assumes the asset follows a specific naming convention.
  # You may need to adjust the asset name based on the repository's actual release assets.
  download_url="https://github.com/${REPO}/releases/download/${latest_version}/js-debug-dap-${latest_version}.tar.gz"

  # Set the output file name
  output_file="js-debug-dap-${version}.tar.gz"

  # Download the tar.gz file
  echo "Downloading the latest version (${latest_version}) from ${REPO}..."
  curl -L -o "$output_file" "$download_url"

  # Check if the download was successful
  if [[ $? -eq 0 ]]; then
    echo "Download completed successfully: ${output_file}"
  else
    echo "Download failed. Please check the download URL or your network connection."
    exit 1
  fi
}

