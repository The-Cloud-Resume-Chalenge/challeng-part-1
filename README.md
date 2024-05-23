![AWS Logo](./images/aws.png)

# Terraform-CloudResumeSetup 

This repository contains Terraform code designed to automate the creation of cloud infrastructure for the Cloud Resume Challenge (Part 1). It's intended to simplify the deployment process and ensure consistent setup of necessary resources for deploying a static resume.

## Architecture

The architecture for this setup is detailed below:

![Architecture Image](./images/architecture.avif)

This first part of the Challenge involves hosting a static website resume on AWS services: S3, CloudFront, Route 53 and ACM.

## Prerequisites

- An AWS account's identity (user or role) with adequate permissions to interact with S3, Route 53, AWS Certificate Manager, and CloudFront.
- If you plan to use a custom domain, it must be previously registered as this is not automated in the script.
- Ensure Terraform is installed.

## Usage

1. Execute `script_lunch.sh`.
2. During the first run, if prompted `"To use an AWS profile, enter the profile name (or type 'none' to specify Access Keys instead):"`, you can enter the AWS profile name if available. If not, type 'none' and provide `aws_access_key_id` and `aws_secret_access_key`.
3. Enter your registered domain name (e.g., example.com). If you don't have a custom domain, press enter to proceed with the CloudFormation-generated one.
4. Type in the HTML index and error files.
5. If asked `"Choose yes if you have a Github with your resume code? (yes/no):"`, type 'yes' if your resume HTML code is in a Github repo, and provide an accessible Github URL pointing to your resume code folder. The repository should contain 'index' and 'error' files at the root, not in a nested folder. If you type 'no', the default code will be used.
6. Wait approximately 6 minutes for your website to be live.

When you see `"Terraform apply succeeded. You can view your website"`, you're all set to view your live cloud resume.

To clean up all resources, run `script_destroy.sh` from the root of your folder. Ensure it reads `"Terraform destroying the static website succeeded"` to verify successful deletion of resources.