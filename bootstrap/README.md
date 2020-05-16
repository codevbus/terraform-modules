# Bootstrap

The `bootstrap.sh` script is a simple tool to automate creating a skeleton directory for a project that utilizes Terraform for deploying infrastructure.

---
**NOTE**

The bootstrapping logic assumes you've created a backend via the method specified in [backend](../backend/README.md). If you don't have a CloudFormation stack named `terraform-backend` with the defined outputs, the script will fail.

---

The script creates an empty project directory, a Terraform subdirectory, and then initializes Terraform with config values interpolated from the `terraform-backend` CloudFormation stack. Finally, it initializes the project directory with `git`.

## Usage

```bash
$ ./bootstrap.sh -n <project-name> -b <base-directory> -p <provider-name> 
```
