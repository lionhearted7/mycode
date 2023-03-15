terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

/* provider block */
provider "null" {
  # Configuration options
}

/*
locals { dummy_rgs = {
          "alpha" = "eastus"
          "bravo" = "southindia"
          "charlie" = "westus2"
       }}

resource "null_resource" "dummy_rgs" {
 
    for_each = (local.dummy_rgs)
        


triggers = {
               name= each.key
               region= each.value
}
}

output "dummy_rgs" {

    value = null_resource.dummy_rgs
} */


#Part2 

locals {  rgs = {
          "alpha" = { "region" ="eastus"
                      "vnet" ="omega" }
          "bravo" = { "region" ="southindia"
                      "vnet" ="psi" }
          "charlie" = {"region" = "westus2"
                       "vnet" ="chi" }
                }}

resource "null_resource" "dummy_rgs" {
  for_each = local.rgs
  triggers = {
               name= each.key     // alpha, bravo, charlie
               region= each.value.region   // eastus, southindia, westus2
}
}

resource "null_resource" "dummy_vnets" {
  for_each = local.rgs
  triggers = {
               name= each.value.vnet        // use value of "vnet" above
               region= each.value.region      // use value of "region" above
               rg= each.key
}
}
