provider "aws" {
    region = "ap-south-1"
    # profile = "eks"
    
} 
module "vpc" {
source = "./modules/vpc"
vpccidr = var.vpccidr
pub-subnet=var.pub-subnet
# pvt-subnet={
#         pvt_sub-1  = {
#          pvt-az    = "ap-south-1a"
#          pvt-cidr  = "10.0.8.0/22"
# },
#          pvt_sub-2 = {
#          pvt-az    = "ap-south-1b"
#          pvt-cidr  = "10.0.12.0/22"
#         }
# }        

env = "dev"
}
module "sg" {
    source = "./modules/sg"
   sg_details = var.sg_details

    vpc_id = module.vpc.dev-vpc-id
}
    
module "iam_role" {
    source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"
snet = {
    snet1 = {
       snet-id = lookup(module.vpc.pub-snet-id,"pub_sub-1",null).id 
       
   },
       snet2 = {
        snet-id = lookup(module.vpc.pub-snet-id,"pub_sub-2",null).id
    }
}

role = module.iam_role.role-arn
node-role = module.iam_role.workernode-role-arn
eks_sg = lookup(module.sg.dev-sg-id,"eks-sg",null)
}