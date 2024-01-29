# Ansible
- This is a simple ansible tutorial.
- The docker-compose file in the repo creates a two containers with ssh server enabled in them.
- You connect to those containers using ssh from your host. just run `ssh -p 2222 user1@localhost` to connect container1 and `ssh -p 2223 user2@localhost` to connect to container2.
- The password for user1 is `pass1` and user2 is `pass2`
- run `ansible-playbook -i inventory.ini install_node.yml`. This installs node on both the containers
