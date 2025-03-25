# run-ansible.ps1
cd "C:\Users\omhg2\OneDrive\Desktop\ZeroGuard\zero_guard"
.\ansible-env\Scripts\Activate.ps1
ansible-playbook -i Ansible/inventory.yml Ansible/kong_playbook.yml
