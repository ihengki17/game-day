# -------------------------------------------------------
# Confluent Cloud Environment
# -------------------------------------------------------
resource "confluent_environment" "cc_handson_env" {
  display_name = "${var.use_prefix}${var.cc_env_name}-${random_id.id.hex}"
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
  standard {}
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
resource "confluent_service_account" "sr" {
  display_name = "sr-${random_id.id.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_service_account" "clients" {
  display_name = "client-${random_id.id.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "app-ksql" {
  display_name = "ksql-${random_id.id.hex}"
  description  = "Service account for ksqlDB cluster"
  lifecycle {
    prevent_destroy = false
  }
}

# --------------------------------------------------------
# Role Bindings (sr, clients)
# --------------------------------------------------------
resource "confluent_role_binding" "sr_environment_admin" {
  principal   = "User:${confluent_service_account.sr.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin" {
  principal   = "User:${confluent_service_account.clients.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "app-ksql-all-topic" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.cc_kafka_cluster.rbac_crn}/kafka=${confluent_kafka_cluster.cc_kafka_cluster.id}/topic=*"
}

resource "confluent_role_binding" "app-ksql-all-group" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.cc_kafka_cluster.rbac_crn}/kafka=${confluent_kafka_cluster.cc_kafka_cluster.id}/group=*"
}

resource "confluent_role_binding" "app-ksql-all-transactions" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.cc_kafka_cluster.rbac_crn}/kafka=${confluent_kafka_cluster.cc_kafka_cluster.id}/transactional-id=*"
}

# ResourceOwner roles above are for KSQL service account to read/write data from/to kafka,
# this role instead is needed for giving access to the Ksql cluster.
resource "confluent_role_binding" "app-ksql-ksql-admin" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "KsqlAdmin"
  crn_pattern = confluent_ksql_cluster.main.resource_name
}

resource "confluent_role_binding" "app-ksql-schema-registry-resource-owner" {
  principal   = "User:${confluent_service_account.app-ksql.id}"
  role_name   = "ResourceOwner"
  crn_pattern = format("%s/%s", confluent_schema_registry_cluster.cc_sr_cluster.resource_name, "subject=*")
}

# --------------------------------------------------------
# ksqlDB Cluster
# --------------------------------------------------------

resource "confluent_ksql_cluster" "main" {
  display_name = "ksql_cluster_0"
  csu = 1
  kafka_cluster {
    id = confluent_kafka_cluster.cc_kafka_cluster.id
  }
  credential_identity {
    id = confluent_service_account.app-ksql.id
  }
  environment {
    id = confluent_environment.cc_handson_env.id
  }
  depends_on = [
    confluent_role_binding.sr_environment_admin,
    confluent_schema_registry_cluster.cc_sr_cluster
  ]
}

# --------------------------------------------------------
# Credentials / API Keys
# --------------------------------------------------------

# Schema Registry
resource "confluent_api_key" "sr_cluster_key" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr.id
    api_version = confluent_service_account.sr.api_version
    kind        = confluent_service_account.sr.kind
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
    confluent_role_binding.sr_environment_admin
  ]
  lifecycle {
    prevent_destroy = false
  }
}

# Kafka clients
resource "confluent_api_key" "clients_kafka_cluster_key" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients.id
    api_version = confluent_service_account.clients.api_version
    kind        = confluent_service_account.clients.kind
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
    confluent_role_binding.clients_cluster_admin
  ]
  lifecycle {
    prevent_destroy = false
  }
}

#ksqlDB Client
resource "confluent_api_key" "ksqldb_api_key" {
  display_name = "ksql-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = "KsqlDB API Key that is owned by 'app-ksql' service account"
  owner {
    id          = confluent_service_account.app-ksql.id
    api_version = confluent_service_account.app-ksql.api_version
    kind        = confluent_service_account.app-ksql.kind
  }

  managed_resource {
    id          = confluent_ksql_cluster.main.id
    api_version = confluent_ksql_cluster.main.api_version
    kind        = confluent_ksql_cluster.main.kind

    environment {
      id = confluent_environment.cc_handson_env.id
    }
  }
}
