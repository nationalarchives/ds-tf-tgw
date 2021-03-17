variable "routable_cidr_blocks" {}
variable "transit_gateway_id" {}

variable "env_public_rt" {}
variable "env_private_rt" {}
variable "env_vpc_cidr" {}

variable "intersite_public_rt" {}
variable "intersite_private_rt" {}

variable "env_public_nacl_rules" {}
variable "env_private_nacl_rules" {}
variable "env_private_db_nacl_rules" {}

variable "env_public_nacl" {}
variable "env_private_nacl" {}
variable "env_private_db_nacl" {}
