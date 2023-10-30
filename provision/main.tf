resource "random_string" "suffix" {
  length  = 4
  special = false
  lower   = true
}

module "kubernets" {
  source = "./modules/kubernetes"
}

resource "harness_platform_secret_text" "inline" {
  for_each                  = local.harness_secrets
  identifier                = lower(replace(each.key, "/[\\s-.]/", "_"))
  name                      = each.key
  description               = each.value.description
  tags                      = each.value.tags
  secret_manager_identifier = "account.harnessSecretManager"
  value_type                = "Inline"
  value                     = each.value.secret
}

module "harness_connectors" {
  depends_on                             = [module.kubernetes, resource.harness_platform_secret_text.inline]
  source                                 = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-connector?ref=refactor"
  suffix                                 = random_string.suffix.id
  harness_platform_kubernetes_connectors = var.harness_platform_kubernetes_connectors
}

module "harness_ccm" {
  source                     = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-ccm/kubernetes?ref=refactor"
  harness_account_id         = var.harness_account_id
  harness_autostopping_token = var.harness_autostopping_token
  kubernetes_connector_id    = module.harness_connectors.all.kubernetes_connectors
}
