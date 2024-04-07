#syntax=docker/dockerfile:1.4
FROM node:20-alpine

# Create app directory
WORKDIR /home/snape

# Install dependencies based on the preferred package manager
COPY --link package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./

RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then yarn global add pnpm && pnpm i; \
  # Allow install without lockfile, so example works even without Node.js installed locally
  else echo "Warning: Lockfile not found. It is recommended to commit lockfiles to version control." && yarn install; \
  fi

COPY --link app ./app
COPY --link configs ./configs
COPY --link database ./database
COPY --link helpers ./helpers
COPY --link jobs ./jobs
COPY --link regiti ./regiti
COPY --link resources/data ./resources/data
COPY --link resources/locales ./resources/locales
COPY --link routes ./routes
COPY --link types ./types
COPY --link utils ./utils
COPY --link .env .
COPY --link index.ts .
COPY --link nodemon.json .
COPY --link tsconfig.json .

# Note: Don't expose ports here, Compose will handle that for us

# Start express.js in development mode based on the preferred package manager
CMD \
  if [ -f yarn.lock ]; then yarn dev; \
  elif [ -f package-lock.json ]; then npm run dev; \
  elif [ -f pnpm-lock.yaml ]; then pnpm dev; \
  else yarn dev; \
  fi
