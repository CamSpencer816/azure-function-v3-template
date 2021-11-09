# azure-function-v3-template

A dotnet template to create a v3 Azure Function including pipelines for Azure DevOps and Terraform to manage the infrastructure

## Requirements

- [.Net Core 3.1 SDK](https://dotnet.microsoft.com/download/dotnet/3.1)
- [Azure Function Core Tools v3 (or later)](https://www.npmjs.com/package/azure-functions-core-tools)
- [Azure CLI ](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform CLI ](https://www.terraform.io/downloads.html)

## Azure Function

TODO

## Continuous Integration / Continuous Delivery

TODO

## Creating infrastructure with Terraform

The `terraform` folder contains a folder to create `test` resources as well as a folder for `prod`. The `.tf` files here assume you have an `Azure Storage Account` already created with a Container named `terraform-state`. You can change how and where your Terraform backend state files are stored and managed by modifying the `terraform.tf` files. Since this resource needs to exist for Terraform to work, it's creation is done manually outside of `.tf` scripts.

It's also expected that you already have the `Azure CLI` installed and that you're logged into the account and subscription where you want the resources to go.

When you're ready to create your resources you can modify the values in `variables.tf` to change how your resources will be named. From within the `test` folder you can run the `terraform init` command to initialize Terraform with the previously mentioned `Storage Account` so that your state file is ready. You can preview the current set of `.tf` files by running `terraform plan` or you can run `terraform apply` which will automatically run `terraform plan` first, wait for you to approve the preview with `yes` and then apply the changes.
