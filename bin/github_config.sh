GITHUB_USERNAME="vincentto13"
KEY_NAME="`whoami`@`hostname`"
SSH_KEY=$HOME/.ssh/id_rsa


if [ ! -f $SSH_KEY ] || [ ! -f $SSH_KEY.pub ]; then
  echo 'Generate your ssh key first!'
  exit
fi

github_result=0
until [ $github_result -eq 1 ]; do
  curl --silent -u "$GITHUB_USERNAME" --data "{\"title\":\"$KEY_NAME\",\"key\":\"$(cat $SSH_KEY.pub)\"}" https://api.github.com/user/keys > gh-result
  if grep -q 'key is already in use' gh-result; then
    github_result=1
    echo 'Key is already in use.'
  elif grep -q '"verified": true' gh-result; then
    github_result=1
    echo "Key ($KEY_NAME) has been added successfully."
  elif grep -q 'Bad credentials' gh-result; then
    echo 'Error during login: invalid username or password!'
    echo 'Try again!'
  else
    echo 'A problem occured during the upload!'
    cat gh-result
    echo 'Try again!'
  fi
  rm gh-result
done
