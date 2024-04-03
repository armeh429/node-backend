# node-backend
this is public repo for developing a backend system with node.js and RESTful API
# Snape project
This lines contains everything needed to get a Express.js development and production environment up and running with Docker Compose.

### Requirements
- Your docker version must be greater than `24`.
- Your node version must be greater than `20`.

### Environment variables
Copy `.env.sample` file and replace it to your project with name `.env`.

## Development
First, run the development server:

```bash
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create snape

# Build dev
docker compose -f docker-compose.mysql.yml -f docker-compose.mongo.yml -f docker-compose.dev.yml -f docker-compose.nginx.yml build

# Up dev
docker compose -f docker-compose.mysql.yml -f docker-compose.mongo.yml -f docker-compose.dev.yml -f docker-compose.nginx.yml up
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Production
First, run the production server.

```bash
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create snape

# Build prod
docker compose -f docker-compose.mysql.yml -f docker-compose.mongo.yml -f docker-compose.prod.yml -f docker-compose.nginx.yml build

# Up prod in detached mode
docker compose -f docker-compose.mysql.yml -f docker-compose.mongo.yml -f docker-compose.prod.yml -f docker-compose.nginx.yml up -d
```

## Useful commands
```bash
# Stop all running containers
docker kill $(docker ps -aq) && docker rm $(docker ps -aq)

# Free space
docker system prune -af --volumes
```

## Installation
#### Change Registry
Migrating from npm registry to yarn registry.

```bash
npm config set registry https://registry.yarnpkg.com/
```

#### Install packages
For install packages please run the following command:

```bash
npm install
```

or

```bash
yarn install
```

### Environment variables
Copy `back/.env.sample` file and replace it to your project with name `back/.env`.

### Build
For build project please run the following command:

```bash
npm run build
```

### Start
For start project please run the following command:

```bash
npm run start
```

### Debug
For debug project please run the following command:

```bash
npm run dev
```

### Linter
For linting project please run the following command:

```bash
npm run lint
```

### Format
For format all files in project please run the following command:

```bash
npm run format
```

### Settings and Helper
For change your application settings and read helpers, please run the following command:

```bash
npm run regiti
```
