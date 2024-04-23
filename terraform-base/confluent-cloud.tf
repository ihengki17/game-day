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

resource "confluent_service_account" "sr2" {
  display_name = "sr-${random_id.id2.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients2" {
  display_name = "client-${random_id.id2.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr3" {
  display_name = "sr-${random_id.id3.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients3" {
  display_name = "client-${random_id.id3.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr4" {
  display_name = "sr-${random_id.id4.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients4" {
  display_name = "client-${random_id.id4.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr5" {
  display_name = "sr-${random_id.id5.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients5" {
  display_name = "client-${random_id.id5.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr6" {
  display_name = "sr-${random_id.id6.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients6" {
  display_name = "client-${random_id.id6.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr7" {
  display_name = "sr-${random_id.id7.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients7" {
  display_name = "client-${random_id.id7.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr8" {
  display_name = "sr-${random_id.id8.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients8" {
  display_name = "client-${random_id.id8.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr9" {
  display_name = "sr-${random_id.id9.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients9" {
  display_name = "client-${random_id.id9.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr10" {
  display_name = "sr-${random_id.id10.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients10" {
  display_name = "client-${random_id.id10.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr11" {
  display_name = "sr-${random_id.id11.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients11" {
  display_name = "client-${random_id.id11.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr12" {
  display_name = "sr-${random_id.id12.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients12" {
  display_name = "client-${random_id.id12.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr13" {
  display_name = "sr-${random_id.id13.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients13" {
  display_name = "client-${random_id.id13.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_service_account" "sr14" {
  display_name = "sr-${random_id.id14.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients14" {
  display_name = "client-${random_id.id14.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr15" {
  display_name = "sr-${random_id.id15.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients15" {
  display_name = "client-${random_id.id15.hex}"
  description  = local.description
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_service_account" "sr_monitor" {
  display_name = "sr-${random_id.id16.hex}"
  description  = local.description
  lifecycle {   
    prevent_destroy = false
  }
}

resource "confluent_service_account" "clients_monitor" {
  display_name = "client-${random_id.id16.hex}"
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

resource "confluent_role_binding" "sr_environment_admin2" {
  principal   = "User:${confluent_service_account.sr2.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin2" {
  principal   = "User:${confluent_service_account.clients2.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin3" {
  principal   = "User:${confluent_service_account.sr3.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin3" {
  principal   = "User:${confluent_service_account.clients3.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin4" {
  principal   = "User:${confluent_service_account.sr4.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin4" {
  principal   = "User:${confluent_service_account.clients4.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin5" {
  principal   = "User:${confluent_service_account.sr5.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin5" {
  principal   = "User:${confluent_service_account.clients5.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin6" {
  principal   = "User:${confluent_service_account.sr6.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin6" {
  principal   = "User:${confluent_service_account.clients6.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin7" {
  principal   = "User:${confluent_service_account.sr7.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin7" {
  principal   = "User:${confluent_service_account.clients7.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin8" {
  principal   = "User:${confluent_service_account.sr8.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin8" {
  principal   = "User:${confluent_service_account.clients8.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin9" {
  principal   = "User:${confluent_service_account.sr9.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin9" {
  principal   = "User:${confluent_service_account.clients9.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin10" {
  principal   = "User:${confluent_service_account.sr10.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin10" {
  principal   = "User:${confluent_service_account.clients10.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin11" {
  principal   = "User:${confluent_service_account.sr11.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin11" {
  principal   = "User:${confluent_service_account.clients11.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin12" {
  principal   = "User:${confluent_service_account.sr12.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin12" {
  principal   = "User:${confluent_service_account.clients12.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin13" {
  principal   = "User:${confluent_service_account.sr13.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin13" {
  principal   = "User:${confluent_service_account.clients13.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin14" {
  principal   = "User:${confluent_service_account.sr14.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin14" {
  principal   = "User:${confluent_service_account.clients14.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin15" {
  principal   = "User:${confluent_service_account.sr15.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin15" {
  principal   = "User:${confluent_service_account.clients15.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cc_kafka_cluster.rbac_crn
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_role_binding" "sr_environment_admin_monitor" {
  principal   = "User:${confluent_service_account.sr_monitor.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = confluent_environment.cc_handson_env.resource_name
  lifecycle {
    prevent_destroy = false
  }
}
resource "confluent_role_binding" "clients_cluster_admin_monitor" {
  principal   = "User:${confluent_service_account.clients_monitor.id}"
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
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
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

resource "confluent_api_key" "sr_cluster_key2" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr2.id
    api_version = confluent_service_account.sr2.api_version
    kind        = confluent_service_account.sr2.kind
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
    confluent_role_binding.sr_environment_admin2
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key3" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr3.id
    api_version = confluent_service_account.sr3.api_version
    kind        = confluent_service_account.sr3.kind
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
    confluent_role_binding.sr_environment_admin3
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key4" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr4.id
    api_version = confluent_service_account.sr4.api_version
    kind        = confluent_service_account.sr4.kind
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
    confluent_role_binding.sr_environment_admin4
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key5" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr5.id
    api_version = confluent_service_account.sr5.api_version
    kind        = confluent_service_account.sr5.kind
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
    confluent_role_binding.sr_environment_admin5
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key6" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr6.id
    api_version = confluent_service_account.sr6.api_version
    kind        = confluent_service_account.sr6.kind
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
    confluent_role_binding.sr_environment_admin6
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key7" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr7.id
    api_version = confluent_service_account.sr7.api_version
    kind        = confluent_service_account.sr7.kind
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
    confluent_role_binding.sr_environment_admin7
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key8" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr8.id
    api_version = confluent_service_account.sr8.api_version
    kind        = confluent_service_account.sr8.kind
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
    confluent_role_binding.sr_environment_admin8
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key9" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr9.id
    api_version = confluent_service_account.sr9.api_version
    kind        = confluent_service_account.sr9.kind
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
    confluent_role_binding.sr_environment_admin9
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key10" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr10.id
    api_version = confluent_service_account.sr10.api_version
    kind        = confluent_service_account.sr10.kind
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
    confluent_role_binding.sr_environment_admin10
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key11" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr11.id
    api_version = confluent_service_account.sr11.api_version
    kind        = confluent_service_account.sr11.kind
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
    confluent_role_binding.sr_environment_admin11
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key12" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr12.id
    api_version = confluent_service_account.sr12.api_version
    kind        = confluent_service_account.sr12.kind
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
    confluent_role_binding.sr_environment_admin12
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key13" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr13.id
    api_version = confluent_service_account.sr13.api_version
    kind        = confluent_service_account.sr13.kind
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
    confluent_role_binding.sr_environment_admin13
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key14" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr14.id
    api_version = confluent_service_account.sr14.api_version
    kind        = confluent_service_account.sr14.kind
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
    confluent_role_binding.sr_environment_admin14
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key15" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr15.id
    api_version = confluent_service_account.sr15.api_version
    kind        = confluent_service_account.sr15.kind
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
    confluent_role_binding.sr_environment_admin15
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "sr_cluster_key_monitor" {
  display_name = "sr-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.sr_monitor.id
    api_version = confluent_service_account.sr_monitor.api_version
    kind        = confluent_service_account.sr_monitor.kind
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
    confluent_role_binding.sr_environment_admin_monitor
  ]
  lifecycle {
    prevent_destroy = false
  }
}

# Kafka clients
resource "confluent_api_key" "clients_kafka_cluster_key1" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
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

resource "confluent_api_key" "clients_kafka_cluster_key2" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients2.id
    api_version = confluent_service_account.clients2.api_version
    kind        = confluent_service_account.clients2.kind
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
    confluent_role_binding.clients_cluster_admin2
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key3" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients3.id
    api_version = confluent_service_account.clients3.api_version
    kind        = confluent_service_account.clients3.kind
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
    confluent_role_binding.clients_cluster_admin3
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key4" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients4.id
    api_version = confluent_service_account.clients4.api_version
    kind        = confluent_service_account.clients4.kind
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
    confluent_role_binding.clients_cluster_admin4
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key5" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients5.id
    api_version = confluent_service_account.clients5.api_version
    kind        = confluent_service_account.clients5.kind
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
    confluent_role_binding.clients_cluster_admin5
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key6" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients6.id
    api_version = confluent_service_account.clients6.api_version
    kind        = confluent_service_account.clients6.kind
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
    confluent_role_binding.clients_cluster_admin6
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key7" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients7.id
    api_version = confluent_service_account.clients7.api_version
    kind        = confluent_service_account.clients7.kind
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
    confluent_role_binding.clients_cluster_admin7
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key8" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients8.id
    api_version = confluent_service_account.clients8.api_version
    kind        = confluent_service_account.clients8.kind
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
    confluent_role_binding.clients_cluster_admin8
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key9" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients9.id
    api_version = confluent_service_account.clients9.api_version
    kind        = confluent_service_account.clients9.kind
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
    confluent_role_binding.clients_cluster_admin9
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key10" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients10.id
    api_version = confluent_service_account.clients10.api_version
    kind        = confluent_service_account.clients10.kind
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
    confluent_role_binding.clients_cluster_admin10
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key11" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients11.id
    api_version = confluent_service_account.clients11.api_version
    kind        = confluent_service_account.clients11.kind
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
    confluent_role_binding.clients_cluster_admin11
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key13" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients13.id
    api_version = confluent_service_account.clients13.api_version
    kind        = confluent_service_account.clients13.kind
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
    confluent_role_binding.clients_cluster_admin13
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key14" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients14.id
    api_version = confluent_service_account.clients14.api_version
    kind        = confluent_service_account.clients14.kind
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
    confluent_role_binding.clients_cluster_admin14
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key15" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients15.id
    api_version = confluent_service_account.clients15.api_version
    kind        = confluent_service_account.clients15.kind
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
    confluent_role_binding.clients_cluster_admin15
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key_monitor" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients_monitor.id
    api_version = confluent_service_account.clients_monitor.api_version
    kind        = confluent_service_account.clients_monitor.kind
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
    confluent_role_binding.clients_cluster_admin_monitor
  ]
  lifecycle {
    prevent_destroy = false
  }
}

resource "confluent_api_key" "clients_kafka_cluster_key12" {
  display_name = "clients-${var.cc_cluster_name}-key-${random_id.id.hex}"
  description  = local.description
  owner {
    id          = confluent_service_account.clients12.id
    api_version = confluent_service_account.clients12.api_version
    kind        = confluent_service_account.clients12.kind
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
    confluent_role_binding.clients_cluster_admin12
  ]
  lifecycle {
    prevent_destroy = false
  }
}
