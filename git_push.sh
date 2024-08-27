#!/bin/bash

# Add all changes
git add .

# Get the current date and time
current_date=$(date "+%Y-%m-%d %H:%M:%S")

# Commit with the current date and time
git commit -m "DBT - $current_date"

# Push to the main branch
git push origin main

