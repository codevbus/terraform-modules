# Backend

At some point in the future, I might consider moving to a more complex bootstrap process that allows Terraform to manage it's own backend infrastructure.

_However..._

Per [the Terraform docs](https://www.terraform.io/docs/backends/types/s3.html), this would seem to be a bit of an antipattern:

> Terraform is an administrative tool that manages your infrastructure, and so ideally the infrastructure that is used by Terraform should exist outside of the infrastructure that Terraform manages. 

I tend to agree, and view this as a ["separation of concerns"](https://en.wikipedia.org/wiki/Separation_of_concerns) problem.

For now, I create the backend with CloudFormation.

## Usage
If you don't already have an S3 bucket and DynamoDB table for handling state and locking, create one with the `setup-backend.sh` script:

```bash
$ ./setup-backend.sh -b <s3bucket-name> -t <dynamodb-table-name>
```

---
**NOTE**

The setup script specifies the stack name as `terraform-backend`. This is the string that the project bootstrapping script expects when parsing for configuration values.

---
