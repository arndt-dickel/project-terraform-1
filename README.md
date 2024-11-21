# Project Terraform 1

This Terraform project deploys a basic web application infrastructure on AWS, including:

- **VPC:** A Virtual Private Cloud with public and private subnets.
- **Subnets:** Public subnets for the load balancer and private subnets for the EC2 instances.
- **Internet Gateway:** For internet connectivity.
- **NAT Gateway:** To allow private instances to access the internet.
- **Route Tables:** To direct traffic within the VPC.
- **Security Groups:** To control network access to the instances and load balancer.
- **Launch Template:** A template for creating EC2 instances with Nginx installed.
- **Auto Scaling Group:** To maintain the desired number of instances.
- **Application Load Balancer:** To distribute traffic across the instances.
- **Target Group:** To register instances as targets for the load balancer.
- **Listener:** To direct traffic to the target group.

## Prerequisites

Before running this Terraform project, you need to:

1. **Create an EC2 Key Pair:**
   - This key pair will be used to SSH into your instances (if needed).
   - You can create a key pair in the AWS Management Console or using the AWS CLI.
   - Make sure the key pair is in the same region (`us-west-2`) as your infrastructure.
   - **Note:** The key pair name should be "project_key" to match the Terraform configuration.

2. **Create an S3 Bucket:**
   - This bucket will be used to store the Terraform state file.
   - You can create an S3 bucket in the AWS Management Console or using the AWS CLI.
   - Choose a unique bucket name and ensure it's in the same region (`us-west-2`).

3. **Set up GitHub secrets (if using the GitHub Actions workflow):**
   - In your GitHub repository settings, go to "Secrets and variables" -> "Actions".
   - Add the following secrets:
     - `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
     - `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.

## Usage

This project includes a GitHub Actions workflow that automatically deploys the infrastructure on every push to the `main` branch.

**To use the GitHub Actions workflow:**

1. **Clone the repository:**




   ```bash
   git clone https://github.com/arndt-dickel/project-terraform-1
   ```

2. **Configure Terraform backend:**
   - Update the `terraform` block in the `main.tf` file with your S3 bucket name and key:

     ```terraform
     terraform {
       backend "s3" {
         bucket = "your-s3-bucket-name"
         key    = "terraform.tfstate"
         region = "us-west-2"
       }
     }
     ```

3. **Ensure GitHub secrets are set up (see Prerequisites).**

**To run the code locally:**

1. **Ensure you have Terraform version 1.0.1 installed.**
2. **Follow steps 1 and 2 above to clone the repository and configure the backend.**
3. **Initialize Terraform:**

   ```bash
   terraform init
   ```

4. **Apply the configuration:**

   ```bash
   terraform apply
   ```

## Outputs

After applying the Terraform configuration, you'll see the following outputs:

- **`load_balancer_dns`:** The DNS name of the Application Load Balancer. Use this to access your web application.
- **`autoscaling_group_name`:** The name of the Auto Scaling group.
- **`vpc_id`:** The ID of the VPC.
- **`public_subnet_ids`:** The IDs of the public subnets.
- **`private_subnet_ids`:** The IDs of the private subnets.

You can access these outputs using `terraform output <output_name>`.

## Cleanup

To destroy the infrastructure created by this project, run:

```bash
terraform destroy
```

## Note

- The `userdata.sh` script installs Nginx on the EC2 instances. You can customize this script to install other software or configure your instances as needed.
- This is a basic example and can be further extended to include more features and configurations, such as:
    - **Variables:**  This project currently uses hardcoded values. Consider using variables for better flexibility and reusability.
    - **More sophisticated user data:** You might want to include more complex configurations or scripts in your user data for setting up applications or services.
    - **Monitoring and logging:** Implement monitoring and logging to track the health and performance of your infrastructure.
- This project uses Terraform version 1.0.1. Make sure you have a compatible version installed if running locally.
