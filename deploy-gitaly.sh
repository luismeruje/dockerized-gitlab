#./deploy user
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u luisferreira --private-key=/Users/luisferreira/.ssh/deployment -v gitaly.yml
