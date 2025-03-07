# Unix motd Script

1. Clone the repository:
```
git clone https://github.com/edwardtakev/uws.git
```
2. Navigate to repo folder
```
cd uws
```
3. Give the script executable permissions:
```
chmod +x run.sh
```
4. Run the script:
```
./run.sh
```

This script will:

    Check if motd.sh exists in the current directory.
    Copy it to /etc/profile.d/.
    Empty the contents of /etc/motd.
