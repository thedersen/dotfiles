#!/bin/zsh

brew install aws-vault
pip3 install --upgrade boto3
pip3 install --upgrade gimme-aws-creds

curl https://raw.githubusercontent.com/thedersen/awscli-profile-credential-helpers/main/aws-console --output /usr/local/bin/aws-console
curl https://raw.githubusercontent.com/thedersen/awscli-profile-credential-helpers/main/aws-refresh-credentials --output /usr/local/bin/aws-refresh-credentials
curl https://raw.githubusercontent.com/thedersen/awscli-profile-credential-helpers/main/aws-whoami --output /usr/local/bin/aws-whoami
curl https://raw.githubusercontent.com/thedersen/awscli-profile-credential-helpers/main/aws-console-completion.bash --output /usr/local/share/zsh/site-functions/aws-console-completion.bash
curl https://raw.githubusercontent.com/thedersen/awscli-profile-credential-helpers/main/aws-profile-completion.bash --output /usr/local/share/zsh/site-functions/aws-profile-completion.bash
