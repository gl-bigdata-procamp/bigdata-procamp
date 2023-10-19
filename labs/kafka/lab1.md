## Apache Kafka Lab 1

### Overview
This lab has two parts:
1. Producer side. Here the task is to extend the Apache Nifi lab and publish the same messages to Apache Kafka.
2. Consumer side. Implement logic on the consumer side using a programming language of your choice.

### Task Description
The goal is to write the BitCoins Transactions data to Kafka, then read this data on the consumer side and compute the top 10 transactions by the `price` field.

On NiFi leacture, the NiFi workflow has been presented, which reads BitCoins transactions data.
A single transaction, converted to a string, looks like the following (where "value" is a default value for data field in Kafka):
```
{
   "data":{
      "id":1297851689496576,
      "id_str":"1297851689496576",
      "order_type":1,
      "datetime":"1605693298",
      "microtimestamp":"1605693298239000",
      "amount":0.014,
      "amount_str":"0.01400000",
      "price":18058.68,
      "price_str":"18058.68"
   },
   "channel":"live_orders_btcusd",
   "event":"order_deleted"
}
```

## Parts that should be implemented and technical constraints
1. Bash script with command that creates a topic in Kafka which will be used for bitcoin transactions
    - self-descriptive name
    - data is stored in a redundant form i.e. not a single copy
2. Producer side.
    - implemented using Apache Nifi out-of-the-box processor
    - acknowledgment from all brokers is configured
3. Consumer side.
    - implement using your language of choice
    - at least once delivery semantics is implemented
    - compute the top 10 bitcoin transactions based on the `price` field (descending) and print them to stdout
        - maintain a collection of the top 10 transactions from the beginning
        - after each consumer poll update this collection
        - after the update, print collection to the stdout.

