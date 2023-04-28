# Start kafka stuff
docker compose -f docker-compose-local.yml up

# Add connectors
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-txn-events.json
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-op-events.json

# Append to files
./op_events.sh
./txn_events.sh

# Stop kafka stuff
docker compose -f docker-compose-local.yml down
