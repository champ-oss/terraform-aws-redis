# only used to encrypt and decrypt redis password
module "kms" {
  count           = var.enable_pw_encryption ? 1 : 0
  source          = "github.com/champ-oss/terraform-aws-kms.git?ref=v1.0.31-3fc28eb"
  git             = var.git
  name            = "alias/redis-${random_string.identifier.result}"
  account_actions = []
  tags            = merge(local.tags, var.tags)
}

resource "aws_kms_ciphertext" "this" {
  count     = var.enable_pw_encryption ? 1 : 0
  key_id    = module.kms[0].key_id
  plaintext = aws_elasticache_replication_group.this.auth_token
}