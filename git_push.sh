#!/bin/bash

# Set your git email and name
git_email="tmdgh663@gmail.com"
git_name="HanHoRang31"

# Configure git
git config --global user.email "$git_email"
git config --global user.name "$git_name"

# Add, commit, and push changes
git add .
git commit -m "update"
git push origin main
