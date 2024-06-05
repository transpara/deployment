# The branch v6-develop is used to manually deploy tSystem
in the .env file please modify the information according to your target machine

```bash
# START
TSYSTEM_ID=049f6ed7-e015-47cd-961c-8ae249cd412d
TSYSTEM_NAME=tsystem
TCACHE_PORT=6379
TCACHE_HOST=tsystem_redis
TSYSTEM_PORT=8000
CONTAINER_HOST=localhost
USERNAME=transpara
SSH_PORT=22
# STOP

TSYSTEM_TAG=1.0.0
TLOG_TAG=0.129.0
TCACHE_TAG=0.129.0

# EOF

```

then,
`docker-compose up -d`

