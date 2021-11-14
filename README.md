# azure-function-v3-template

A dotnet template to create a v3 Azure Function including pipelines for Azure DevOps and Terraform to manage the infrastructure

## Requirements

- [.Net Core 3.1 SDK](https://dotnet.microsoft.com/download/dotnet/3.1)
- [Azure Function Core Tools v3](https://www.npmjs.com/package/azure-functions-core-tools)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform CLI](https://www.terraform.io/downloads.html)

## Azure Function

The Function contains a single `HTTP Trigger` function which accepts simple `string` input and returns a new `string` with based on the input. Since the Function has `local.settings.json` under `.gitignore`, you'll want to make a copy of the `example.local.settings.json` file and rename it to `local.settings.json` to add your own configuration as needed. A small set of unit tests are included to validate positive and negative cases of running the Function.

## Creating infrastructure with Terraform

The `terraform` folder contains a folder to create `test` resources as well as a folder for `prod`. The `.tf` files here assume you have an `Azure Storage Account` already created with a Container named `terraform-state`. You can change how and where your Terraform backend state files are stored and managed by modifying the `terraform.tf` files. Since this resource needs to exist for Terraform to work, it's creation is done manually outside of `.tf` scripts.

It's also expected that you already have the `Azure CLI` installed and that you're logged into the account and subscription where you want the resources to go.

When you're ready to create your resources you can modify the values in `variables.tf` to change how your resources will be named. From within the `test` folder you can run the `terraform init` command to initialize Terraform with the previously mentioned `Storage Account` so that your state file is ready. You can preview the current set of `.tf` files by running `terraform plan` or you can run `terraform apply` which will automatically run `terraform plan` first, wait for you to approve the preview with `yes` and then apply the changes.

## Continuous Integration / Continuous Delivery

The `azure-devop` folder contains a `.yml` pipeline that can be used when creating a new Azure DevOps `Pipeline`. The name of the Function's and their `Azure Subscription` (which is really the name of your Azure DevOps `Service Connection`) are configured in a `variables` block. You can modify the block to match the names of your resources.

The pipeline is configured to run two stage: `Build` and `DeployToTest`. All pushed commits to the `main` branch, as well as any pull requests going into the `main` branch will trigger a new run of the pipeline. The `Build` stage will build the Function app, run unit tests, and then publish the artifacts. The `DeployToTest` stage will run after a successful non-PR build of the `main` branch and will get the artifacts and deploy them to the `test` version of the Function.
