# Generate default TAGs for every resources

Adds git repo and branch automatically

Usage:
 Call the module and set other default tags you need
```
module "autotags" {
  source = "git@github.com:bikochan/autotags.git?ref=1.0"
}
```

then inside your resources or modules `tags` parameter block use the `tags` output
```
 resource "aws_instance" "foo" {
(snip...)
   tags = "${module.autotags.tags}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| extra\_tags | Extra tags and overrides | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| tags | Generated tags and other defaults |

