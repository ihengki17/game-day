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

output "cc_kafka_cluster" {
  description = "CC Kafka Cluster ID"
  value       = resource.confluent_kafka_cluster.cc_kafka_cluster.id
}

output "cc_kafka_cluster_bootsrap" {
  description = "CC Kafka Cluster ID"
  value       = resource.confluent_kafka_cluster.cc_kafka_cluster.bootstrap_endpoint

}

output "SRKey1" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key1.id
}
output "SRSecret1" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key1.secret
  sensitive   = true
}

output "ClientKey1" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key1.id
}
output "ClientSecret1" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key1.secret
  sensitive   = true
}