#!/bin/bash

# Help function
function usage() {
	echo "Usage:"
	echo "    -h         Display this help message"
	echo "    -b         Name of the S3 Bucket for storing state"
	echo "    -t         Name of the DynamoDB Table for storing state locks"
	exit 2
}


# Parse command line options
while getopts "hb:t:" opt; do
	case ${opt} in
		h) usage ;;
		b) BUCKETNAME="${OPTARG}" ;;
		t) TABLENAME="${OPTARG}" ;;
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

if [[ -z $BUCKETNAME ]]; then
	echo "Invalid Option: Please specify a name for the S3 Bucket"
	exit 1
fi

if [[ -z $TABLENAME ]]; then
	echo "Invalid Option: Please specify a name for the DynamoDB Table"
	exit 1
fi	

#Run CloudFormation creation command
aws cloudformation create-stack --stack-name terraform-backend --template-body file://backend.yaml --parameters ParameterKey=BucketNameParameter,ParameterValue="$BUCKETNAME" ParameterKey=TableNameParameter,ParameterValue="$TABLENAME"
