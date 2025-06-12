# 1) Build stage
FROM node:18-alpine AS builder
WORKDIR /app
RUN npm config set registry https://registry.npmjs.cf
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 2) Runtime stage
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# Copiar build standalone
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public

EXPOSE 3000
CMD ["node", "server.js"]