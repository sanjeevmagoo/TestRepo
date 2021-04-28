
variable "region" {
  description = "STAGING Region for all the imploy resources"
  default     = "eu-west-1"
}

variable "project_name" {
  default     = "imploy"
  description = "ethermint-testnet"
}


# variable "vpc_id" {
#   description = "source path for project"
#   type        = string
#   default     = "./"
# }

//variable "subnet_id" {}
//variable "tags" {
//  description = "vpc tags"
  //type        = string
  //default     = "./"

//}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
