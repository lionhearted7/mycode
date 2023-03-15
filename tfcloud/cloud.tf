terraform {
  cloud {
    organization = "TesterOrg777"

    workspaces {
      name = "sjworkspace"
    }
  }
}
