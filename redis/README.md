### Access

```javascript
# ioredis
const redis = new Redis({
  sentinels: [{ host: "redis_sentinel_1", port: 26379 }],
  name: "mymaster",
});
```

### Scale

```bash
docker-compose up --scale slave=2 --scale sentinel=3
```
