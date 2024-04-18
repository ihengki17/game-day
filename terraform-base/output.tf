output "cc_hands_env" {
  description = "Confluent Cloud Environment ID"
  value       = resource.confluent_environment.cc_handson_env.id
}

output "cc_handson_sr" {
  description = "CC Schema Registry Region"
  value       = data.confluent_schema_registry_region.cc_handson_sr
}

output "cc_sr_cluster" {
  description = "CC SR Cluster ID"
  value       = resource.confluent_schema_registry_cluster.cc_sr_cluster.id
}

output "cc_sr_cluster_endpoint" {
  description = "CC SR Cluster ID"
  value       = resource.confluent_schema_registry_cluster.cc_sr_cluster.rest_endpoint
}

output "cc_ksql_endpoint" {
  description = "CC ksqldb Cluster ID"
  value       = resource.confluent_ksql_cluster.main.rest_endpoint
}

output "cc_kafka_cluster" {
  description = "CC Kafka Cluster ID"
  value       = resource.confluent_kafka_cluster.cc_kafka_cluster.id
}

output "cc_kafka_cluster_bootsrap" {
  description = "CC Kafka Cluster ID"
  value       = resource.confluent_kafka_cluster.cc_kafka_cluster.bootstrap_endpoint

}

output "cc_ksql_cluster" {
  description = "CC ksql Cluster ID"
  value       = resource.confluent_ksql_cluster.main.id
}

output "SRKey" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key.id
}
output "SRSecret" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key.secret
  sensitive = true
}

output "ClientKey" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key.id
}
output "ClientSecret" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key.secret
  sensitive = true
}

output "ksqlKey" {
  description = "ksql clients Key"
  value       = confluent_api_key.ksqldb_api_key.id
}
output "ksqlSecret" {
  description = "ksql Client Secret"
  value       = confluent_api_key.ksqldb_api_key.secret
  sensitive = true
}
