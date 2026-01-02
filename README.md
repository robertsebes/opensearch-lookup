# OpenSearch Setup Script

This repository contains a simple Ruby script to connect to an OpenSearch cluster and explore its indices. The goal is to provide a safe, reusable setup without exposing sensitive credentials.

---

## Files in this repository

- `opensearch_setup.rb` — The main Ruby script to connect to OpenSearch.
- `Gemfile` — Specifies the gems required to run the script.
- `.gitignore` — Ensures sensitive files like `.env` are not committed.

---

## Setup Instructions

git clone git@github.com:robertsebes/opensearch-lookup.git
cd opensearch-lookup

run
bundle install

Create a file called .env in the same folder:

OPENSEARCH_HOST=https://your-opensearch-host:port
OPENSEARCH_USER=your-username
OPENSEARCH_PASSWORD=your-password

Run the script
You should see:

connected!

