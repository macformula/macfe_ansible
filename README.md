# MACFE Infrastructure

Ansible playbooks for configuring MAC Formula machines. Playbooks are ran from an arbitrary control machine, not the machines you are provisioning.

## Requirements for Control Machine

- Python3
- Ansible

A virtual environment is recommended.

## Requirements for Target Machines

- SSH server running (sshd)
- User account accessible via SSH key authentication
- Python3

## Setup

1. Create and activate a virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

2. Install Ansible and dependencies:
   ```bash
   pip install ansible
   ansible-galaxy install -r requirements.yml
   ```

3. Set up SSH key authentication to target machines:
   ```bash
   ssh-copy-id macformula@<target-ip>
   ```

## Usage

Run the main playbook:
```bash
ansible-playbook -i inventory site.yaml
```

Or if you haven't set up SSH keys, specify a password:
```bash
ansible-playbook -i inventory site.yaml --ask-pass
```
