## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | ID of the AMI to use for the instance. | `any` | n/a | yes |
| instance | Type/size of the EC2 instance. | `any` | n/a | yes |
| key | SSH key for accessing the instance. | `any` | n/a | yes |
| name | Name of the instance. | `any` | n/a | yes |
| profile | IAM instance profile to attach to the instance. | `any` | n/a | yes |
| sgs | Security group IDs to attach to the instance. | `list` | n/a | yes |
| ud | User data for the instance. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the instance. |
| public\_ip | Public IP of the instance. |

