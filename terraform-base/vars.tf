locals {
  description = "Resource created using terraform"
}

# --------------------------------------------------------
# This 'random_id_4' will make whatever you create (names, etc)
# unique in your account.
# --------------------------------------------------------
resource "random_id" "id" {
  byte_length = 4
}

resource "random_id" "id1" {
  byte_length = 4
}

resource "random_id" "id2" {
  byte_length = 4
}

resource "random_id" "id3" {
  byte_length = 4
}

resource "random_id" "id4" {
  byte_length = 4
}

resource "random_id" "id5" {
  byte_length = 4
}

resource "random_id" "id6" {
  byte_length = 4
}

resource "random_id" "id7" {
  byte_length = 4
}

resource "random_id" "id8" {
  byte_length = 4
}

resource "random_id" "id9" {
  byte_length = 4
}

resource "random_id" "id10" {
  byte_length = 4
}

resource "random_id" "id11" {
  byte_length = 4
}

resource "random_id" "id12" {
  byte_length = 4
}

resource "random_id" "id13" {
  byte_length = 4
}

resource "random_id" "id14" {
  byte_length = 4
}

resource "random_id" "id15" {
  byte_length = 4
}

resource "random_id" "id16" {
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
  default = "ap-southeast-1"
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
  default = "ap-southeast-1"
}

variable "sr_package" {
  type    = string
  default = "ESSENTIALS"
}

