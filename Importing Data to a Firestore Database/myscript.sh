#!/bin/bash

# Get the Project ID automatically
export PROJECT_ID=$(gcloud config get-value project)

# Enable Firestore API
gcloud services enable datastore.googleapis.com

# Clone the lab repository
git clone https://github.com/robmorgan/firestore-import-export.git
cd firestore-import-export

# Install dependencies
npm install

# Download the data file for the lab
gsutil cp gs://cloud-training/pureskill/firestore/customers.json .

# Run the import script
node import.js customers.json

echo "Lab setup complete! Check your Firestore database now."
