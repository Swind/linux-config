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
