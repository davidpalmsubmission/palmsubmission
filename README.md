
---

<p align="center"> Terraform Test
    <br> 
</p>

## 📝 Table of Contents

- [S3 Backend](#s3backend)
- [TFVARS](#tfvars)
- [Security Group](#sg)
- [EBS](#ebs)
- [EC2 Instance](#ec2)
- [Module](#module)

## S3 Backend <a name = "s3backend"></a>

Currently, this terraform file is simply storing state locally. Add a backend provider so that the state is stored in s3.

```
The setup.tf file has the S3 bucket creation and also implements a dynamo DB table which acts as a lock on the statefile 
to prevent multiple people from writing at the same time.
Then the backend is declared in main.tf starting at line 9.
```

## .tfvars file <a name = "tfvars"></a>

The resources are currently using a few hard coded values directly in the .tf file itself. Move those variables into a 
tfvars file and use references instead.

```
Variables were setup in the terraform.tfvars file. I was a bit conflicted on this given so little information. 
I fully acknowledge that you might not always create variables for availability zones. Also, things like subnets
and security group IDs might be implemented using the data selector. Finally, you may want to add validation to 
variables to comply with AWS naming restrictions.
```

## Create a security group <a name = "sg"></a>

A security group was manually created in the AWS management console (called "sg-ipfs-arn"). Recreate this security 
group in terraform. In a comment, write down the process of reconciling the manually created sg with the new terraform 
resource. The security group has ingress of ports 4001, 8080, 22 open to all.

```
The security group is in the vpc.tf file. The rules are created in the terraform.tfvars file. I made some assumptions
on the egress part. I provided a comment here too regarding manually reconciling the security group created. I like the
loop method to keep the terraform clean.
```

## Attach EBS volumes <a name="ebs"></a>

The terraform currently provisions ec2 instances and ebs volumes, but the ebs volumes are not attached to the instances. 
Attach the ebs volumes to the ec2 instances.

```
The volumes are attached in the main.tf per the example starting on line 70. Keep in mind at this point the volumes
are attached but not necessarily mounted.
```


## Create a third ec2 instance <a name = "ec2"></a>

Create a third ec2 instance in subnet "private-subnetid-3" in availability zone "eu-west-1c".

```
A third instance is created in main.tf line 43 with volume creation and attachment on line 65 and line 82.
```

## Convert to module <a name = "module"></a>

The current setup does not allow for easy scalability, and the patterns seem more suited to the usage of a terraform module.

```
This solution is in the ipfs-ec2 folder. I typically have a top level folder called modules where this would reside.
I have included a couple of outputs and made some assumptions on the variables. Again, typically there are modules for
most major/re-usable components. 
```
```
To utilize the module:

module "ec2" {
    source = "./modules/ipfs-ec2"
}

and then fill in the appropriate variables etc
```
