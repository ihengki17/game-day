locals {
  description = "Resource created using terraform"
}

# --------------------------------------------------------
# This 'random_id_4' will make whatever you create (names, etc)
# unique in your account.
# --------------------------------------------------------
resource "random_id" "id1" {
  byte_length = 4
}

# ----------------------------------------
# Generic prefix to use in a common organization
# ----------------------------------------
variable "use_prefix" {
  description = "If a common organization is being used, and default names are not updated, choose a prefix"
  type        = string
  default     = ""
}

# ----------------------------------------
# Confluent Cloud Kafka cluster variables
# ----------------------------------------
variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key (also referred as Cloud API ID)"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
  sensitive   = true
}

variable "cc_cloud_provider" {
  type    = string
  default = "AWS"
}

variable "cc_cloud_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "cc_env_name" {
  type    = string
  default = "game-day"
}

variable "cc_cluster_name" {
  type    = string
  default = "cc_game-day_cluster"
}

variable "cc_availability" {
  type    = string
  default = "SINGLE_ZONE"
}

# ------------------------------------------
# Confluent Cloud Schema Registry variables
# ------------------------------------------
variable "sr_cloud_provider" {
  type    = string
  default = "AWS"
}

variable "sr_cloud_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "sr_package" {
  type    = string
  default = "ESSENTIALS"
}

