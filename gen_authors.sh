#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e 

# Get the directory of the current script and store it in the variable SCRIPTDIR.
SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" 

# Get the root directory of the git repository containing the current script and store it in the variable ROOTDIR.
ROOTDIR="$(git -C "$SCRIPTDIR" rev-parse --show-toplevel)" 

# Print each command before executing it.
set -x 

# Create or overwrite the file AUTHORS in the root directory of the git repository.
# Get a list of all authors who have contributed to the git repository and write it to the AUTHORS file.
cat > "${ROOTDIR}/AUTHORS" <<- EOF 
 $(git -C "$ROOTDIR" log --format='%aN <%aE>' | LC_ALL=C.UTF-8 sort -uf) 
EOF
