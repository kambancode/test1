
# DevOps_Engineer-Take_home_task.pdf


Test description:

### Phase 1. Base project

    1. Create a GitHub repository:
    2. Use IaC to deploy the following:
    3. VPC AWS
    4. EC2 instances
    5. Small demo app reachable from the exterior.
    6. RDS

### Phase 2. This is an open-ended task so we want to evaluate what you can add to a simple scenario. We will give extra points for the following (But not restricted to):

    1. Security
    2. Integrations
    3. GitOps patterns
    4. Reusability
    5. Monitoring

----------
Phase 1 done.
Phase 2 can't be finalised ...

### About completed project features:
    1. Security
	    1. RDS 
		    1. password in safely stored in SSM parameter store
	    2. ALB + DNS name
		    1. When ALB switched On - no EIP and dirrect access to EC2.
		    2. When ALB switched Off - EC2 has EIP and can be reached from net
	    3. endpoint for S3
		    1. No traffic over internet
	    4. VPC private subnets for RDS
	    5. VPC no direct access to EC2
	    6. VPC route tables
	    7. SG
    2. Integrations
	    1. versioning on aws DynamoDb + s3 for TF state
    3. GitOps patterns
	    1. GitHub Action to trigger TF apply
    4. Reusability
	    1. modular approach
	    2. on/off switch for resurces
    5. Monitoring
	    1. CW - for everything with test-demo-dashboard
	    2. CW - CPU Alert

### About project features - what could be done next:
    1. Github:
        1. Integrations: Branching for developers: Dev shoul be able to create his env out of his branch with all Github actions
        2. Integrations: Require a pull request before merging + Require approvals. Block direct commits to main.
        3. Integrations: PR triggers terraform plan (test) + GitHub notification -> integrate with Slack/Teams via webhooks.
        4. Integrations: merge triggers terraform apply
        5. Add prod Enviroment
    2. High Availability: Auto-scaling group of EC2
    3. Security: Certificate for SSL
    4. Security, High Availability:CloudFront
    5. Security:: WAF
    6. Rute53
    7. Disaster Recovery: Region failover using Route53 + DAtabase failiover
    8. Security: VPC - adding NACL rules
    9. etc. This list cannot be completed.

### Work log: 
https://github.com/kambancode/test1/activity  

    1. Commit 1:
       - setup: aws user, github, intellij
       - VPC - 2 Private/2 public subnets, Internet Gateway, EIP, Route table
       - EC2 + SG
       - RDS  + password in parameter store
    2. Commit 2:
       - ALB + DNS name, CPU usage Alert, on/off switch resources
    3. Commit 3:
       - endpoint to S3
    4. Commit 4:
       - versioning on aws DynamoDb + s3 for TF state
       - CW for everything with test-demo-dashboard 
    5. Commit 5:
       - commit into main triggers terraform plan
          - Github: github_oidc_role_arn = "arn:aws:iam::5X6X12XXXXX0:role/test-demo-github-actions-role"