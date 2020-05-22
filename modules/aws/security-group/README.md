## Requirements

| Name | Version |
|------|---------|
| aws | >= 2.62.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.62.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress\_rules | List of egress rule objects | <pre>list(object({<br>	from_port   = number<br>	to_port     = number<br>	protocol    = string<br>	cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |
| ingress\_rules | List of ingress rule objects | <pre>list(object({<br>	from_port   = number<br>	to_port     = number<br>	protocol    = string<br>	cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| name | Name of the security group. | `any` | n/a | yes |
| vpc | ID of the VPC to place the security group in. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the security group. |
| id | ID of the security group. |

