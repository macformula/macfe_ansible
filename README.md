# MACFE Infrastructure

Ansible playbooks for configuring MAC Formula machines.

## Requirements

- Python3
- Ansible

A virtual environment is recommended.

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

## Usage

Run the main playbook:
```bash
ansible-playbook -i inventory site.yaml
```