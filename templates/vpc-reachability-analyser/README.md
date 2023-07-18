# Template - Using the VPC Route Analyser (Terraform)

Disclaimer: **There are costs associated with running this example. Please check **

This template will create the following AWS Resources:

* EC2 Instance for testing route analysis.
* VPC Reachability analyser path (EC2 to VPC IGW)
* VPC Reachability analysis for path created above.



It also requires the following variables in a `terraform.tfvars` file:

``
vpc_id
subnet_id
``
*Note that* the subnet route table should have routing configured separately and should have an internet gateway (igw) for showing a successful route analysis test.

Outputs:

* Analysis status
* Analysis status message
* Analysis explanation
* Path found (Boolean flag)

Pre-requisites:

1. Terraform
2. 

How to Run:

1. Clone repo
2. Open `templates/vpc-reachability-analyser` in IDE.
3. Make sure the right aws credentials are being used. Paste creds into terminal/set up aws cli profile. 
Check if aws creds are valid with following command:
`aws sts get-caller-identity`
4. Run `terraform init` to initialise terraform.
5. Run `terraform plan` to plan your terraform deployment.
6. Run `terraform apply --auto-approve` to create the infrastructure on aws.
7. Check the outputs on the cli to see the results of the route analysis. Alternatively you can check the route analysis in the AWS Console Under `VPC -> Scroll to bottom on the left menu -> Network Manager -> VPC Reachability Analyser`.

Cleanup:
To clean up the code, use `terraform destroy`. Wait for the brief to load and then type `yes` and press enter.

Final notes:

This example was made out of curiosity. For a more practical use case (testing/CICD Pipelines) one should use the reachability analyser via the aws cli or using python + boto3. Terraform can be used to create a bunch of "tests" or paths on the vpc reachability analyser but is not the best tool to run the tests.

The tests once created (using the cli or a programming language + SDK) can be integrated with CICD pipelines and can be used to test your network before and after making changes to it.

Terraform/this example can be used for the following use cases:

* Conditionally create resources/infrastructure based on network checks.
* Verify that a change has not caused a regression in the network connectivity.
* Verify that a change in the network config is working as intended.
