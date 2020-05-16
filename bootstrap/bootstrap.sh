#!/bin/bash


# Help function
function usage() {
	echo "Usage:"
	echo "    -h         Display this help message"
	echo "    -n         Name of the project being bootstrapped"
	echo "    -b         The base directory where the project directory should live, ex: ~/projects"
	echo "    -p         The Terraform provider for the project, ex: aws, azure"
	exit 2
}

# Parse command line options
while getopts "hn:b:p:" opt; do
	case ${opt} in
		h) usage ;;
		n) PROJECTNAME="${OPTARG}" ;;
		b) BASEDIR="${OPTARG}" ;;
		p) PROVIDER="${OPTARG}" ;;
		:)
			echo "Invalid Option -${OPTARG} requires an argument" 1>&2
			exit 1
			;;
		*)
			echo "Invalid Option -${OPTARG}" 1>&2
			exit 1
			;;
	esac
done

if [[ -z $PROJECTNAME ]]; then
	echo "Invalid Option: Please specify a project name"
	exit 1
fi

if [[ -z $BASEDIR ]]; then
	echo "Invalid Option: Please specify a base directory for the project"
	exit 1
fi

if [[ -d $BASEDIR/$PROJECTNAME ]]; then
	echo "Invalid Option: The project directory already exists! Please choose a different name."
	exit 1
fi

if [[ -z $PROVIDER ]]; then
	echo "Invalid Option: Please specify a provider "
	exit 1
fi

#Check if there is a 'terraform-backend' CloudFormation stack
if aws cloudformation describe-stacks --stack-name terraform-backend ; then
	echo "terraform-backend CloudFormation stack detected, parsing it for values..."
	BUCKETNAME=$(aws cloudformation describe-stacks --stack-name terraform-backend | jq '.Stacks[] | select(.StackName == "terraform-backend") | .Outputs[] | select(.OutputKey == "StateBucketName").OutputValue')
	TABLENAME=$(aws cloudformation describe-stacks --stack-name terraform-backend | jq '.Stacks[] | select(.StackName == "terraform-backend") | .Outputs[] | select(.OutputKey == "LockTableName").OutputValue')
	BUCKETREGION=$(aws s3api get-bucket-location --bucket "$BUCKETNAME" | jq '.LocationConstraint')
else
	echo "No terraform-backend CloudFormation stack detected!"
	echo "Please manually configure your Terraform project."
	exit 1
fi	

# Bootstrap the project

cd "$BASEDIR" || exit 1

mkdir -p "$PROJECTNAME/terraform" && cd "$PROJECTNAME" || exit 1

# Templatized terraform configuration file
cat <<EOF > terraform/config.tf
provider "$PROVIDER" {}

terraform {
  backend "s3" {
    bucket         = $BUCKETNAME
    key            = "$PROJECTNAME/terraform.tfstate"
    region         = $BUCKETREGION
    dynamodb_table = $TABLENAME
    encrypt        = true
  }
}     
EOF

# Terraform init *should* prompt for bucket region 
cd terraform/ && terraform init || exit 1

cd .. && git init || exit 1

echo "Project successfully bootstrapped!"
