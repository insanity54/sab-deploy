# sab-deploy


Deploy an OpenBazaar-Server to a remote machine using Ansible. This is how I deploy and back up my OpenBazaar store, [Save-A-Bit](ob://@saveabit/store) (ob://@saveabit/store).

**Shameless plug** do you need a way to see if your OpenBazaar store is online? Use my free service [myopenbazaar.top](https://myopenbazaar.top/). Example use: https://myopenbazaar.top/v1/online/@saveabit

## Feature status

* [x] Deployment playbook
* [x] SSL setup
* [x] Backup playbook
* [x] Restore from backup playbook

## Administrative tasks

### deploy your openbazaar server

Set a username and password for your openbazaar store. a template is provided (`vars/secret.template.yml`) which needs to be edited then renamed to `vars/secret.yml`.

After setting your username and password, encrypt the file!

    ansible-vault encrypt vars/secret.yml

Run the main.yml playbook

    ansible-playbook main.yml

Your new server will deploy. Also, a SSL root certificate authority file will be copied to your local machine, to the path `archive_directory/[HOSTNAME]/etc/openbazaar/rootCA.crt`. Associate this `rootCA.crt` file with your operating system ([STEP 2 of this guide](https://slack-files.com/T02FPGBKB-F0XK9ND2Q-fc5e6500a3)) to establish a secure connection to your OpenBazaar server.

You can now log in to your OpenBazaar-Server through the OpenBazaar-Client installed on your local machine. Be sure that SSL is enabled in OpenBazaar-Client.

### change your openbazaar server's API password (the password you use to log in through OpenBazaar-Client)

To keep a secure server, It's important to change your password every now and then.

edit the secrets file, changing your password to a new one.

    ansible-vault edit vars/secret.yml


### back up your openbazaar store

Simply run the backup.yml playbook

    ansible-playbook backup.yml

a timestamped archive will be created in your local backup directory


### restore your openbazaar store

This is meant to be used just after deploying a new server, when you already have an existing store backup. The restore playbook expects you used the backup playbook to make your backup, as it will copy *from* the `archive_directory` folder similarly to how the backup playbook copies *to* the `archive_directory` folder.

Care must be taken with restoration, as it will overwrite any remote openbazaar store data with a local backup. Make sure that's what you really want to do!

    ansible-playbook restore.yml


## Feedback

I welcome feedback! Especially negative feedback. I'm looking to improve my DevOps skills. Feel free to open an [issue](https://github.com/insanity54/sab-deploy/issues).
