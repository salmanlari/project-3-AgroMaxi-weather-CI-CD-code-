vpccidr = "10.0.0.0/20"

pub-subnet={
        pub_sub-1 = {
         pub-az   = "ap-south-1a"
         pub-cidr = "10.0.0.0/22"
},
         pub_sub-2  = {
         pub-az     = "ap-south-1b"
         pub-cidr   = "10.0.4.0/22"
        }
}

sg_details = {
    eks-sg ={
        name               ="ec2"
        description        = "only ssh allow"

        ingress_rules =[
           {
                from_port    = "22"
                to_port      = "22"
                protocol     = "tcp"
                cidr_blocks  = ["0.0.0.0/0"]
                               
            },
    ]
    }
}