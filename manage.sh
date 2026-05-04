#!/bin/bash

# Configuration
VENV_DIR="venv"

# Helper functions for the script to use
info() { echo -e "\e[34m[INFO]\e[0m $1"; }
success() { echo -e "\e[32m[SUCCESS]\e[0m $1"; }
error() { echo -e "\e[31m[ERROR]\e[0m $1"; exit 1; }

case "$1" in
    setup)
        info "Cleaning old environment..."
        rm -rf $VENV_DIR
        
        info "Creating Virtual Environment..."
        python3 -m venv $VENV_DIR || error "Failed to create venv"
        
        info "Updating pip..."
        ./$VENV_DIR/bin/pip install --upgrade pip
        
        if [ -f requirements.txt ]; then
            info "Installing from requirements.txt..."
            ./$VENV_DIR/bin/pip install -r requirements.txt
        else
            info "No requirements.txt found, installing defaults..."
            echo "fastapi" > requirements.txt
            echo "uvicorn" >> requirements.txt
            ./$VENV_DIR/bin/pip install -r requirements.txt
        fi
        success "Environment ready."
        ;;
    dev)
        if [ ! -d "$VENV_DIR" ]; then
            error "Environment not found. Run ./manage.sh setup first."
        fi
        info "Starting FastAPI..."
        ./$VENV_DIR/bin/uvicorn app.main:app --reload
        ;;
    *)
        echo "Usage: ./manage.sh {setup|dev}"
        ;;
esac
