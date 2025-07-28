#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

PACKAGE_NAME="django_ledger_nonprofit"

echo "Cleaning old builds..."
rm -rf dist/ build/ ${PACKAGE_NAME}.egg-info

echo "Building the package..."
python -m build

echo "Checking package..."
twine check dist/*

echo "Uploading to local PyPI server..."
twine upload --verbose --repository local dist/*
