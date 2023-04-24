# only used to encrypt and decrypt redis password
module "kms" {
  count           = var.enable_pw_encryption ? 1 : 0
  source          = "github.com/champ-oss/terraform-aws-kms.git?ref=v1.0.30-44f94bf"
  git             = var.git
  name            = "alias/${var.git}-lambda"
  account_actions = []
}

resource "aws_kms_ciphertext" "this" {
  count     = var.enable_pw_encryption ? 1 : 0
  key_id    = module.kms[0].key_id
  plaintext = aws_elasticache_replication_group.this.auth_token
}