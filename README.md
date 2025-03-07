#Unix motd Script

1. Clone the repository:
```
git clone [https://github.com/your-username/shift-calendar.git](https://github.com/edwardtakev)
cd shift-calendar
```

2. Give the script executable permissions:
```
chmod +x run.sh
```

3. Run the script:
```
./run.sh
```

This script will:

    Check if motd.sh exists in the current directory.
    Copy it to /etc/profile.d/.
    Empty the contents of /etc/motd.
