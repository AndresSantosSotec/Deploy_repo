# ─── Etapa 1: Builder ───────────────────────────────────
FROM node:18-alpine AS builder
WORKDIR /app

# Copia sólo manifestos y lockfiles para cachear instalación
COPY package.json package-lock.json ./
RUN npm ci           

# Copia el resto del código y genera build
COPY . .
RUN npm run build     

# ─── Etapa 2: Runner ────────────────────────────────────
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# Copiamos sólo lo necesario para producción:
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public

EXPOSE 3000
# El server.js arrancará en el puerto 3000
CMD ["node", "server.js"]
