# uws
Unix motd Script

Instructions:

1. clone the repo
> git clone https://github.com/edwardtakev

2. cd to the directory of the repo
> cd /uws

3. Give the script executable permissions
> chmod +x update_motd.sh

4. Run the script:
> ./update_motd.sh

This script will:

    Check if motd.sh exists in the current directory.
    Copy it to /etc/profile.d/.
    Empty the contents of /etc/motd.
