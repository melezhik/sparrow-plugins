set -e

apk add --no-cache --update \
  python3 \
  py3-pip \
  gcc \
  musl-dev \
  python3-dev \
  libffi-dev \
  openssl-dev \
  cargo \
  make

# Create and activate a virtual environment for Azure CLI
python3 -m venv /opt/venv \
  && . /opt/venv/bin/activate \
  && pip install --upgrade pip \
  && pip install --no-cache-dir azure-cli \
  && deactivate


PATH="/opt/venv/bin:$PATH"

echo "===="

az --version

echo "===="

echo 'to start using az cli: export PATH="/opt/venv/bin:$PATH"'

