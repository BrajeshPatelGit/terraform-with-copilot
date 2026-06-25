# VPC Peering Terraform Project

This project provides a Terraform configuration for establishing VPC peering connections between Amazon Web Services (AWS) Virtual Private Clouds (VPCs). 

## Project Structure

The project is organized into the following directories and files:

- **modules/vpc_peering/**: Contains the VPC peering module.
  - **main.tf**: Defines the VPC peering resource and its configuration.
  - **variables.tf**: Declares input variables required for the VPC peering module.
  - **outputs.tf**: Defines outputs for the VPC peering module.

- **environments/**: Contains environment-specific variable files.
  - **dev/terraform.tfvars**: Variable values for the development environment.
  - **prod/terraform.tfvars**: Variable values for the production environment.

- **providers.tf**: Specifies the required providers for the Terraform configuration.

- **main.tf**: The entry point for the Terraform configuration, calling the VPC peering module.

- **variables.tf**: Declares input variables for the main Terraform configuration.

- **outputs.tf**: Defines outputs for the main Terraform configuration.

- **versions.tf**: Specifies the required Terraform and provider versions.

- **terraform.tfvars.example**: An example of variable values for users to create their own variable files.

## Getting Started

1. **Clone the Repository**: Clone this repository to your local machine.
2. **Navigate to the Project Directory**: Change into the project directory.
3. **Initialize Terraform**: Run `terraform init` to initialize the project and download the necessary providers.
4. **Configure Variables**: Update the `terraform.tfvars` files in the `environments/dev` or `environments/prod` directories with your specific values.
5. **Plan the Deployment**: Run `terraform plan` to see the resources that will be created.
6. **Apply the Configuration**: Run `terraform apply` to create the VPC peering connection.

## Requirements

- Terraform 1.x or later
- AWS account with necessary permissions to create VPC peering connections

## License

This project is licensed under the MIT License. See the LICENSE file for details.