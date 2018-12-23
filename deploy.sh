#./deploy user
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook gitaly.yml --user=$1