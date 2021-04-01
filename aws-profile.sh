#!/bin/zsh

brew install aws-vault
pip3 install --upgrade boto3
pip3 install --upgrade gimme-aws-creds

REPO=https://raw.githubusercontent.com/thedersen/awscli-profile-credential-helpers/main
BIN="$(brew --prefix)/bin"
COMPLETION="$(brew --prefix)/etc/bash_completion.d"

curl "${REPO}/aws-console" --output "${BIN}/aws-console"
curl "${REPO}/aws-refresh-credentials" --output "${BIN}/aws-refresh-credentials"
curl "${REPO}/aws-whoami" --output "${BIN}/aws-whoami"
curl "${REPO}/aws-console-completion.bash" --output "${COMPLETION}/aws-console-completion.bash"
curl "${REPO}/aws-profile-completion.bash" --output "${COMPLETION}/aws-profile-completion.bash"

chmod +x "${BIN}/aws-console"
chmod +x "${BIN}/aws-refresh-credentials"
chmod +x "${BIN}/aws-whoami"
