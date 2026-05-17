#!/bin/bash

# Get Project ID
export PROJECT_ID=$(gcloud config get-value project)

# Enable Firestore
gcloud services enable datastore.googleapis.com --project=$PROJECT_ID

# Direct Download (This fixes the GitHub Username error)
wget https://raw.githubusercontent.com/robmorgan/firestore-import-export/master/import.js
wget https://raw.githubusercontent.com/robmorgan/firestore-import-export/master/package.json

# Install and Run
npm install
gsutil cp gs://cloud-training/pureskill/firestore/customers.json .
node import.js customers.json

echo "DONE! Go check your progress on the lab page."
