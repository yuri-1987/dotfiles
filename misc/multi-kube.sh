#!/usr/bin/env sh

# List of files in config.d
kubeConfigFileList=$(find ${HOME}/.kube/kubeconfig.d -type f)

# Combine all file paths into the single `KUBECONFIG` variable.
while IFS= read -r kubeConfigFile; do
  KUBECONFIG+=":${kubeConfigFile}"
done <<< ${kubeConfigFileList}

# Export the `KUBECONFIG` variable so that it can be 'seen' by commands
# following this script.
export KUBECONFIG
