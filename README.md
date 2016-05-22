# sab-deploy


Deploy an OpenBazaar-Server to a remote machine using Ansible.

## Administrative tasks

### deploy your openbazaar server

Set a username and password for your openbazaar store. a template is provided (vars/secret.template.yml) which needs to be edited then renamed to vars/secret.yml. Then, encrypt it!

    ansible-vault encrypt vars/secret.yml

run the main.yml playbook

    ansible-playbook main.yml

your new server will deploy and you can log in using OpenBazaar-Client.


### change your openbazaar server's API password (the password you use to log in through OpenBazaar-Client)

To keep a secure server, It's important to change your password every now and then.

edit the secrets file, changing your password to a new one.

    ansible-vault edit vars/secret.yml


### back up your openbazaar store

Simply run the backup.yml playbook

    ansible-playbook backup.yml

a timestamped archive will be created in your local backup directory


### restore your openbazaar store

This is meant to be used just after deploying a new server, when you already have an existing store backup. The restore playbook expects you used the backup playbook to make your backup, as it will copy *from* the `archive_directory` folder similarly to how the backup playbook copies *to* the `archive_directory` folder. Care must be taken with restoration, as it will overwrite any remote openbazaar store data with a local backup. Make sure that's what you really want to do!

    ansible-playbook restore.yml
