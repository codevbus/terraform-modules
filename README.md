[![Derek](https://alexellis.o6s.io/badge?repo=terraform-modules&owner=codevbus](https://github.com/alexellis/derek/)
# Terraform Modules
This repository contains terraform code I use in various projects, broken out by module.

In the base of the repo is a basic CloudFormation template and shell script for creating a remote state backend if one does not already exist. 

## Prerequisites
* Terraform `>= 0.12.25`
* jq `>= 1.6`
* AWSCLI installed and configured with active AWS credentials

## Setup
Setup involves deploying a remote backend, and then bootstrapping project folders as needed.

### Backend
The [backend](backend/README.md) folder contains a Cloudformation template, wrapped with a shell script, for creating an S3 bucket and DynamoDB table for remote state and locking.

### Bootstrapping
The [bootstrap](bootstrap/README.md) folder contains a project bootstrapping shell script. It assumes you have created a backend using the CloudFormation template included in this repository.
