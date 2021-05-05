# Configure the AWS Provider
provider "aws" {
  region     = var.region
}

module "tfstate" {
  source = "../../modules/state_store"
  env = var.stage
  s3_bucket = "${var.prefix}.tf-${var.stage}-infra-state"
  s3_bucket_name = "${var.prefix} ${var.stage} terraform state store"
  dynamodb_table = "${var.prefix}_${var.stage}_infra"
}
