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

output "SRKey2" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key2.id
}
output "SRSecret2" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key2.secret
  sensitive   = true
}

output "ClientKey2" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key2.id
}
output "ClientSecret2" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key2.secret
  sensitive   = true
} 

output "SRKey3" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key3.id
}
output "SRSecret3" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key3.secret
  sensitive   = true
}

output "ClientKey3" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key3.id
}
output "ClientSecret3" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key3.secret
  sensitive   = true
} 

output "SRKey4" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key4.id
}
output "SRSecret4" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key4.secret
  sensitive   = true
}

output "ClientKey4" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key4.id
}
output "ClientSecret4" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key4.secret
  sensitive   = true
} 

output "SRKey5" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key5.id
}
output "SRSecret5" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key5.secret
  sensitive   = true
}

output "ClientKey5" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key5.id
}
output "ClientSecret5" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key5.secret
  sensitive   = true
} 

output "SRKey6" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key6.id
}
output "SRSecret6" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key6.secret
  sensitive   = true
}

output "ClientKey6" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key6.id
}
output "ClientSecret6" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key6.secret
  sensitive   = true
} 

output "SRKey7" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key7.id
}
output "SRSecret7" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key7.secret
  sensitive   = true
}

output "ClientKey7" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key7.id
}
output "ClientSecret7" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key7.secret
  sensitive   = true
} 

output "SRKey8" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key8.id
}
output "SRSecret8" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key8.secret
  sensitive   = true
}

output "ClientKey8" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key8.id
}
output "ClientSecret8" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key8.secret
  sensitive   = true
} 

output "SRKey9" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key9.id
}
output "SRSecret9" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key9.secret
  sensitive   = true
}

output "ClientKey9" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key9.id
}
output "ClientSecret9" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key9.secret
  sensitive   = true
} 

output "SRKey10" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key10.id
}
output "SRSecret10" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key10.secret
  sensitive   = true
}

output "ClientKey10" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key10.id
}
output "ClientSecret10" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key10.secret
  sensitive   = true
} 

output "SRKey11" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key11.id
}
output "SRSecret11" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key11.secret
  sensitive   = true
}

output "ClientKey11" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key11.id
}
output "ClientSecret11" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key11.secret
  sensitive   = true
} 

output "SRKey12" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key12.id
}
output "SRSecret12" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key12.secret
  sensitive   = true
}

output "ClientKey12" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key12.id
}
output "ClientSecret12" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key12.secret
  sensitive   = true
} 

output "SRKey13" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key13.id
}
output "SRSecret13" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key13.secret
  sensitive   = true
}

output "ClientKey13" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key13.id
}
output "ClientSecret13" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key13.secret
  sensitive   = true
} 

output "SRKey14" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key14.id
}
output "SRSecret14" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key14.secret
  sensitive   = true
}

output "ClientKey14" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key14.id
}
output "ClientSecret14" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key14.secret
  sensitive   = true
} 

output "SRKey15" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key15.id
}
output "SRSecret15" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key15.secret
  sensitive   = true
}

output "ClientKey15" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key15.id
}
output "ClientSecret15" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key15.secret
  sensitive   = true
} 

output "SRKey_monitor" {
  description = "CC SR Key"
  value       = confluent_api_key.sr_cluster_key_monitor.id
}
output "SRSecret_monitor" {
  description = "CC SR Secret"
  value       = confluent_api_key.sr_cluster_key_monitor.secret
  sensitive   = true
}

output "ClientKey_monitor" {
  description = "CC clients Key"
  value       = confluent_api_key.clients_kafka_cluster_key_monitor.id
}
output "ClientSecret_monitor" {
  description = "CC Client Secret"
  value       = confluent_api_key.clients_kafka_cluster_key_monitor.secret
  sensitive   = true
} 
