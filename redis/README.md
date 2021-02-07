### Access

```javascript
const client = redis.createClient({
  port: 7001,
  host: "redis_master_1",
});
```

### Scale

```bash
docker-compose up --scale slave=2 --scale sentinel=3
```
