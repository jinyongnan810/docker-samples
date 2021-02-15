#!/bin/bash

MONGODB1=mongo1
MONGODB2=mongo2
ARBITER=arbiter

echo "**********************************************" ${MONGODB1}
echo "Waiting for startup.."
until curl http://${MONGODB1}:27017/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done


echo SETUP.sh time now: `date +"%T" `
mongo --host ${MONGODB1}:27017 <<EOF
var cfg = {
    "_id": "rs0",
    "protocolVersion": 1,
    "version": 1,
    "members": [
        {
            "_id": 0,
            "host": "${MONGODB1}:27017",
            "arbiterOnly" : false,
            "priority": 1
        },
        {
            "_id": 1,
            "host": "${MONGODB2}:27017",
            "arbiterOnly" : false,
            "priority": 0.5
        },
        {
            "_id": 2,
            "host": "${ARBITER}:27017",
            "arbiterOnly" : true,
            "priority": 0
        }
    ],
    settings: {
        "chainingAllowed": true,
        "heartbeatTimeoutSecs": 1,
        "electionTimeoutMillis":10000,
    }
};
rs.initiate(cfg, { force: true });
rs.reconfig(cfg, { force: true });
rs.secondaryOk();
db.getMongo().setReadPref('nearest');
db.getMongo().setSecondaryOk(); 
EOF