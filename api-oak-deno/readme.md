# Contents

- [Create a Postgres Container](#create-a-postgres-container)
- [Generate Code From Template](#generate-code-from-template)
- [Style Guide](#style-guide)

# Create a Postgres Container

I'm strongly recommend you use portainer to manager your containers.
There are some app container templates on portainer service. 

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

# Architecture 
Deno 1.x
Postgresjs 3.x  insteadof denodb
Alosaur         reason see also: https://github.com/denosaurs/bench

# Generate Code From Template

```
PDMAN Client
```

# Nessie,Denon Install

deno install --unstable --allow-net --allow-env --allow-read=. --allow-write=nessie.config.ts,db -f https://deno.land/x/nessie/cli.ts 
deno install -qAf --unstable https://deno.land/x/denon/denon.ts

# Style Guide

easy CRUD: Active Record complicated CRUD: traditional sql

https://yoshixmk.github.io/deno-x-ranking/

https://deno.land/manual@v1.20.6/contributing/style_guide

# Use Dockerfile

```
$ docker build -t app . && docker run -it -p 1993:1993 app
```

# Structure Sample

```
api-oak-deno inspired by eggjs
├── deps.ts
├── main.ts (entrypoint)
├── agent.ts(optional)
├── app
|   ├── router.ts
│   ├── controller
│   |   └── home.ts
│   ├── model
│   |   └── active_record.ts
│   ├── type
│   |   └── context.ts (user-defined OakContext)
│   ├── repository
│   |   └── mapper.ts
│   ├── service (optional)
│   |   └── user.ts
│   ├── middleware (optional)
│   |   └── response_time.ts
│   ├── schedule (optional)
│   |   └── my_task.ts
│   ├── public (optional)
│   |   └── reset.css
│   ├── view (optional)
│   |   └── home.tpl
│   └── extend (optional)
│       ├── helper.ts(optional)
│       ├── request.ts(optional)
│       ├── response.ts(optional)
│       ├── context.ts(optional)
│       ├── application.ts(optional)
│       └── agent.ts(optional)
├── config
|   ├── plugin.ts
|   ├── config.default.ts
│   ├── config.prod.ts
|   ├── config.ts(optional)
|   ├── config.local.ts(optional)
|   └── config.unittest.ts(optional)
└── test
    ├── middleware
    |   └── response_time.test.ts
    └── controller
        └── home.test.ts
```
