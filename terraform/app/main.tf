# ========================================================================
# Lock Azure Resource Groups
# ========================================================================
data "external" "resource_groups" {
  program = ["bash", "${path.module}/get_resource_groups.sh", var.app_subscription_id]
}

resource "azurerm_management_lock" "rg_lock" {
  for_each = {
    for rg_name, rg_id in data.external.resource_groups.result : rg_name => rg_id
    if rg_name != var.excluded_rg
  }

  name       = "rg-lock"
  scope      = each.value
  lock_level = "CanNotDelete"
  notes      = "Lock applied to prevent accidental deletion of resources"
}
