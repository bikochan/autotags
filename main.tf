/**
 * # Generate default TAGs for every resources
 *
 * Adds git repo and branch automatically
 *
 * Usage:
 * Call the module and set other default tags you need
 * ```
 * module "autotags" {
 *   source = "git@github.com:bikochan/autotags.git?ref=1.0"
 * }
 *```
 *
 * then inside your resources or modules `tags` parameter block use the `tags` output
 * ```
 * resource "aws_instance" "foo" {
 * (snip...)
 *    tags = "${module.autotags.tags}"
 * }
 *```
*/

provider "external" {
  version = "~> 1.0"
}

variable "extra_tags" {
  description = "Extra tags and overrides"
  type        = "map"
  default     = {}
}

// Generated tags and other defaults
output "tags" {
  value = "${merge(local.tags, var.extra_tags)}"
}

data "external" "gitinfo" {
  program = ["${path.module}/gitinfo"]
}

locals {
  tags = {
    Description = "Managed by terraform"
    repo        = "${data.external.gitinfo.result.repo}"
    branch      = "${data.external.gitinfo.result.branch}"
  }
}
