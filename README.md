## Prerequisites
- [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Have your raspberry pi setup with Ubuntu Desktop 22.04.3 LTS (64-BIT)
- setup SSH
  - `sudo apt-get install openssh-server`
- Connect the raspberry pi to WiFi and get the IP
  - `ifconfig`, your IP is the number after inet under wlan0

## Ansible
- Find the IP of the raspberry pi you want to ssh into
- edit `hosts` to add your host IP under `macfe` group
- ssh into the raspberry pi and save fingerprint
- Test that you can ping the raspberry pi with:
  - ansible -u user all -m ping --ask-pass
- run `ansible-playbook -i hosts deploy.yml --ask-become-pass`
