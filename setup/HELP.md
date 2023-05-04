# Start kafka stuff

## Download MongoDB Connector (Source and Sink)

- URL: `https://www.confluent.io/hub/mongodb/kafka-connect-mongodb`
- Extract zip into `/setup/plugins` folder
- Start docker containers:
  - `docker compose -f docker-compose-local.yml up`

# MongoDB setup

## Connect to MongoDB
```mongodb://localhost:27017,localhost:27018,localhost:27019/?replicaSet=rs0&readPreference=primary&ssl=false```

## Add user
```
use admin
db.createUser(
{
user: "anna",
pwd: "password",
roles: [ "readWrite", "dbAdmin" ]
}
);
```

## Create DB and collection on MongoDB Compass
`dev-entitlement-service-db.entitlement`

## Load data into collection from file with MongoDB Compass
`files/db`

# Add connectors
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-txn-events.json
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-op-events.json
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @mongo-sink.json
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @mongo-source.json

# Append to files
./op_events.sh
./txn_events.sh

# Stop kafka stuff
docker compose -f docker-compose-local.yml down
