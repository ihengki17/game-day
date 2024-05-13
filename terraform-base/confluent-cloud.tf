# -------------------------------------------------------
# Confluent Cloud Environment
# -------------------------------------------------------
resource "confluent_environment" "cc_handson_env" {
  display_name = "${var.use_prefix}${var.cc_env_name}-${random_id.id1.hex}"
  lifecycle {
    prevent_destroy = false
  }
}

# --------------------------------------------------------
# Schema Registry
# --------------------------------------------------------
data "confluent_schema_registry_region" "cc_handson_sr" {
  cloud   = var.sr_cloud_provider
  region  = var.sr_cloud_region
  package = var.sr_package
}
resource "confluent_schema_registry_cluster" "cc_sr_cluster" {
  package = data.confluent_schema_registry_region.cc_handson_sr.package
  environment {
    id = confluent_environment.cc_handson_env.id
  }
  region {
    id = data.confluent_schema_registry_region.cc_handson_sr.id
  }
  lifecycle {
    prevent_destroy = false
  }
}

# --------------------------------------------------------
# Confluent Cloud Kafka Cluster
# --------------------------------------------------------
resource "confluent_kafka_cluster" "cc_kafka_cluster" {
  display_name = "${var.use_prefix}${var.cc_cluster_name}"
  availability = var.cc_availability
  cloud        = var.cc_cloud_provider
  region       = var.cc_cloud_region
  dedicated {
    cku=2
  }
  environment {
    id = confluent_environment.cc_handson_env.id
  }
  lifecycle {
    prevent_destroy = false
  }
}

# --------------------------------------------------------
# Service Accounts (sr, clients)
# --------------------------------------------------------
resource "confluent_service_account" "sr1" {
  display_name = "sr-${random_id.id1.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients1" {
  display_name = "client-${random_id.id1.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

# --------------------------------------------------------
# Role Bindings (sr, clients)
# --------------------------------------------------------
resource "confluent_role_binding" "sr_environment_admin1" {
  principal   = "User:${confluent_service_account.sr1.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin1" {
  principal   = "User:${confluent_service_account.clients1.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

# --------------------------------------------------------
# Credentials / API Keys
# --------------------------------------------------------

# Schema Registry
resource "confluent_api_key" "sr_cluster_key1" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id1.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr1.id
    api_version = confluent_service_account.sr1.api_version
    kind        = confluent_service_account.sr1.kind
  }
  managed_resource {
    id          = confluent_schema_registry_cluster.cc_sr_cluster.id
    api_version = confluent_schema_registry_cluster.cc_sr_cluster.api_version
    kind        = confluent_schema_registry_cluster.cc_sr_cluster.kind
    environment {
      id = confluent_environment.cc_handson_env.id
    }
  }
  depends_on = [
    confluent_role_binding.sr_environment_admin1
  ]
  lifecycle {
    prevent_destroy = false
  }
}

# Kafka clients
resource "confluent_api_key" "clients_kafka_cluster_key1" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id1.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients1.id
    api_version = confluent_service_account.clients1.api_version
    kind        = confluent_service_account.clients1.kind
  }
  managed_resource {
    id          = confluent_kafka_cluster.cc_kafka_cluster.id
    api_version = confluent_kafka_cluster.cc_kafka_cluster.api_version
    kind        = confluent_kafka_cluster.cc_kafka_cluster.kind
    environment {
      id = confluent_environment.cc_handson_env.id
    }
  }
  depends_on = [
    confluent_role_binding.clients_cluster_admin1
  ]
  lifecycle {
    prevent_destroy = false
  }
}