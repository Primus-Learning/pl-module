variable vpc_name {
  type        = string
  default     = "pl-lms"
  description = "vpc name"
}

variable environment {
  type        = string
  default     = "dev"
  description = "env name"
}


variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable azs {
  type        = list
  default     = ["us-east-1a", "us-east-1b"]
  description = "availability zones"
}

variable private_subnet_cidr {
  type        = list
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = " private subnets"
}

variable public_subnet_cidr {
  type        = list
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  description = " public subnets"
}
