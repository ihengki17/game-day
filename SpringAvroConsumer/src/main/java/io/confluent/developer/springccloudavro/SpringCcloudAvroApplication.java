package io.confluent.developer.springccloudavro;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;
import io.confluent.developer.avro.Transaction;

@SpringBootApplication
public class SpringCcloudAvroApplication {

  public static void main(String[] args) {
    SpringApplication.run(SpringCcloudAvroApplication.class, args);
  }
}

@Component
class Consumer {

  @KafkaListener(topics = {"transaction_avro"}, groupId = "spring-boot-kafka")
  public void consume(ConsumerRecord<Integer, Transaction> record) {
    System.out.println("received = " + record.value() + " with key " + record.key());
  }
}
