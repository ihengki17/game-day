require("dotenv").config();
const express = require("express");
const cors = require("cors");
const axios = require("axios");
const { kafka_producer } = require("./producer");
const { v4: uuidv4 } = require("uuid");

const app = express();
app.use(cors());
app.use(express.json());

const options = {
  topic: "store.transactions",
  clients: {
    ##change the property from zookeeper connection to bootstrap connection
    "zookeeper.connect": process.env.ZOOKEEPER.CONNECT,
    ##parsing the API Key and secret from the Confluent Cloud
    "sasl.username": process.env.SASL_USERNAME,
    "sasl.password": process.env.SASL_PASSWORD,
    "sasl.mechanisms": "PLAIN",
    "security.protocol": "SASL_SSL",
    ##optimize the performance
    "linger.ms": "5",
    "batch.size": "16384"
    ##compression on producer
    "compression.type":"none"
  },
  ksqldb: {
    "ksqldb.api.key": process.env.KSQLDB_API_KEY,
    "ksqldb.api.secret": process.env.KSQLDB_API_SECRET,
    "ksqldb.app.endpoint": process.env.KSQLDB_APP_ENDPOINT,
  },
};
console.log(options);

const producer = kafka_producer(options);

app.post("/balance", (req, res) => {
  log("info", "Received new balance request.", { card: req.body.value.card });
  const data = JSON.stringify({
    ksql: `SELECT * FROM balances WHERE card_number='${req.body.value.card}';`,
    streamsProperties: {},
  });

  // console.log(data);

  var config = {
    method: "post",
    url: `${process.env.KSQLDB_APP_ENDPOINT}/query`,
    headers: {
      Accept: "application/vnd.ksql.v1+json",
      "Content-Type": "application/vnd.ksql.v1+json",
      Authorization: `Basic ${Buffer.from(
        `${process.env.KSQLDB_API_KEY}:${process.env.KSQLDB_API_SECRET}`
      ).toString("base64")}`,
    },
    data: data,
  };

  console.log(config);

  axios(config)
    .then((result) => {
      log("info", "Successfully queried for current balances.", result.data);
      res.status(200).send({
        message: "Successfully queried for current balances.",
        results: result.data,
      });
    })
    .catch((error) => {
      log("error", "Error encountered querying current balance", error.stack);
    });
});

app.post("/transactions", (req, res) => {
  var date = Date.now();
  var isoDateString = new Date().toISOString();
  log("info", "Received new transaction request at: ", isoDateString, " .", {
    card: req.body.value.card,
    amount: req.body.value.amount,
  });
  producer
    .then((producer) => {
      const key = uuidv4();
      const value = Buffer.from(
        JSON.stringify({
          transaction_id: key,
          card_number: req.body.value.card,
          transaction_amount: req.body.value.amount,
          transaction_time: isoDateString,
        })
      );
      producer.produce(options.topic, -1, value, key);
      log("info", "Produced transaction successfully.", { key: key });

      res.status(200).send({
        message: "Produced transaction successfully.",
        values: {
          id: key,
          card: req.body.value.card,
          amount: req.body.value.amount,
          timestamp: isoDateString,
        },
      });
    })
    .catch((err) => {
      log("error", "Encountered an error producing transaction.", err.stack);
      res
        .status(500)
        .send({ message: "Encountered an error producing transaction." });
    });
});

const log = (level, message, event) => {
  switch (level) {
    case "info":
      console.info(new Date(Date.now()).toISOString(), "INFO", {
        message: message,
        event,
        event,
      });
      break;
    case "warn":
      console.warn(new Date(Date.now()).toISOString(), "WARN", {
        message: message,
        event,
        event,
      });
      break;
    case "error":
      console.error(new Date(Date.now()).toISOString(), "ERROR", {
        message: message,
        event,
        event,
      });
      break;
    default:
      console.log(new Date(Date.now()).toISOString(), "INFO", {
        message: message,
        event,
        event,
      });
      break;
  }
};

app.listen(8001, (err) => {
  log("info", "Express app started.", null);
  if (err) {
    log("error", "Error encountered in express API.", err.stack);
  }
});
