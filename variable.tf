
variable "vpccidr" {
  
}


variable "pub-subnet" {
  type = map(object({
   pub-cidr =  string
    pub-az   = string

  })) 
}

# variable "pvt-subnet" {
#   type = map(object({
#     pvt-cidr =  string
#     pvt-az   = string

#   })) 
# }


variable "sg_details" {
    type          = map(object({
    name          = string
    description   = string
    # vpc_id        = string

    ingress_rules = list(object({
    from_port     = number
    to_port       = number
    protocol      = string
    cidr_blocks   = list(string)
    # security_groups =list(string)

    }))
}))
}