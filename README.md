# Unix motd Script

1. Clone the repository:
```
git clone https://github.com/edwardtakev/uws.git
```
2. Navigate to repo folder
```
cd uws
```
3. Run the script:
```
./run.sh
```

# One Liner:
```
git clone https://github.com/edwardtakev/uws.git && cd uws && ./run.sh && source /root/.bashrc
```
This script will:

    Check if motd.sh exists in the current directory.
    Copy it to /etc/profile.d/.
    Empty the contents of /etc/motd.
    Replaces /root/.bashrc with the .bashrc from the current directory.
    
    Run source /root/.bashrc to apply the changes immediately.
