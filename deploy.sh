#!/bin/bash
set -e

ENV="${1:-prod}"
echo "Deploying to $ENV"

# Pull latest code
git pull origin main

# Install dependencies in virtual environment
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Run tests
pytest tests/

# Retrain model if needed (with versioning)
python train_model.py --output models/house_model_$(date +%Y%m%d).pkl

# Reload service without downtime
# Only run this if systemd is available and you have sudo
if command -v systemctl >/dev/null 2>&1; then
    sudo systemctl reload my-ml-api || echo "Warning: systemctl reload failed"
else
    echo "No systemd found – skipping service reload"
fi
