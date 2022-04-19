# Contents

- [Create a Postgres Container](#create-a-postgres-container)
- [Generate Code From Template](#generate-code-from-template)
- [Style Guide](#style-guide)

# Create a Postgres Container

```shell script
docker run \
	-d \
	--name pgsql \
	-p 5432:5432 \
	-e POSTGRES_USER=root \
	-e POSTGRES_PASSWORD=pwd \
	-v D:/tmp/pgdata:/var/lib/postgresql/data \
	postgres:lastest
```

# Generate Code From Template
```
deno --unstable run --allow-read  index.ts 
```


deno install --unstable --allow-net --allow-env --allow-read=. --allow-write=nessie.config.ts,db -f  https://deno.land/x/nessie/cli.ts

# Style Guide

https://deno.land/manual@v1.20.6/contributing/style_guide