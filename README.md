# Cloud Resume Challenge - S3 Static Website Hosting
This Terraform project automates the deployment of a static website on S3 for the Cloud Resume Challenge. Check out my [blog post](https://devopsmajid.hashnode.dev/cloud-resume-challenge-part-1) for a detailed walkthrough.


![AWS Logo](./images/aws.png)



Welcome to the Cloud Resume Challenge (Part 1) repository. This code base provides you with Terraform automation scripts to create your own cloud infrastructure and launch a notable static website for your resume on AWS S3.

With a simple execution of our code, you take the first step in modernizing your professional showcase and bid adieu to tedious manual configurations.

## Architecture

The architecture for this setup is detailed below:

![Architecture Image](./images/architecture.avif)

This first part of the Challenge involves hosting a static website resume on AWS services: S3, CloudFront, Route 53 and ACM.

## Prerequisites

- An AWS account's identity (user or role) with adequate permissions to interact with S3, Route 53, AWS Certificate Manager, and CloudFront.
- If you plan to use a custom domain, it must be previously registered as this is not automated in the script.
- Ensure Terraform is installed.

## How to Use

1. Execute `script_lunch.sh`.
2. During the first run, if prompted `"To use an AWS profile, enter the profile name (or type 'none' to specify Access Keys instead):"`, you can enter the AWS [profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) name if available. If not, type 'none' and provide `aws_access_key_id` and `aws_secret_access_key`.

3. Enter your registered domain name (e.g., example.com). If you don't have a custom domain, enter 'no' to proceed with the CloudFormation-generated one.
4. Type in the HTML index and error files.
5. If asked `"Choose yes if you have a Github with your resume code? (yes/no):"`, type 'yes' if your resume HTML code is in a Github repo, and provide an accessible Github URL pointing to your resume code folder. The repository should contain 'index' and 'error' files at the root, not in a nested folder. If you type 'no', the default code will be used.
6. Wait approximately 6 minutes for your website to be live.

When you see `"Terraform apply succeeded. You can view your website"`, you're all set to view your live cloud resume.

To clean up all resources, run `script_destroy.sh` from the root of your folder. Ensure it reads `"Terraform destroying the static website succeeded"` to verify successful deletion of resources.


To reset all variables, run `script_reset.sh` from the root of your folder.