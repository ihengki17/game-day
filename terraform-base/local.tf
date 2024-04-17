resource "null_resource" "game-day-prep" {
  depends_on = [
    resource.confluent_environment.cc_handson_env,
    resource.confluent_schema_registry_cluster.cc_sr_cluster,
    resource.confluent_kafka_cluster.cc_kafka_cluster,
  ]
  provisioner "local-exec" {
    command = "./00_create_client.properties.sh"
  }
}
