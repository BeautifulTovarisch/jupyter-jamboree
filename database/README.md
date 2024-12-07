# Database Module

This module contains a basic notebook that simply connects to a PosgreSQL
database running on a local machine. The database is provisioned and run using
[docker compose](https://docs.docker.com/compose/)

## Getting Started

Start by activating a virtual environment and installing packages

```bash
python3 -m venv venv
python3 -m pip install --upgrade pip

pip install -r requirements.txt

python3 -m ipykernel install --user --name venv
```

This should install everything you need for this module.

Next, start the database with:

```bash
docker compose up -d
```

This will provision and initalize a database locally in a Docker container.

Finally, run `jupter lab` and select the `venv` kernel from the Launcher.

### Shutdown and Cleanup

To shutdown the database without removing it data, run:

```bash
docker compose down
```

To completely remove **all data**:

```bash
docker compose down -v
```

## Data Model


