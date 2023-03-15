/* Alta3 Research - rzfeeser@alta3.com
   Working with "for_each" within a null_resource */

/* Terraform block */
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

/* provider block */
provider "null" {
  # Configuration options
}

/* a list of local variables */
/*
locals {
  Machines = { "RAM" = "5Gi", "CPU" = "5",  "Name" = "alpha" }, { "RAM" = "3Gi", "CPU" = "3", "Name" = "bravo"}
}
*/

locals { Machines = {
                     "alpha" = {"RAM" = "5Gi"
                                "CPU" = "5"},
                     "bravo" = {"RAM" = "3Gi"
                                "CPU" = "3"}
       }}

/* The null_resource implements the standard resource lifecycle but takes no more action */
resource "null_resource" "Machines" {
  for_each = local.Machines
  /* triggers allows specifying a random set of values that when
     changed will cause the resource to be replaced */
  triggers = {
    # name = each.value  // a special variable, "each" created by terraform
    // the object has "each.key" and "each.value"
    CPU_count = each.value.CPU    # return the map {RAM=whatever CPU =whatever}
    RAM_count = each.value.RAM
    Name_count = each.key

    #Resource_name  = each.key
    #resource_value = each.value

  }
}

/* We want these outputs */
output "Machines" {
  value = null_resource.Machines
}

