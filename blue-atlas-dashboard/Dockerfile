# Etapa de build
FROM node:20-alpine AS builder

WORKDIR /app

# Usar un mirror confiable para evitar errores 503
RUN npm config set registry https://registry.npmjs.org
# Copiar archivos de definición de dependencias
COPY package.json package-lock.json ./

# Instalar todas las dependencias (incluyendo devDependencies)
RUN npm install

# Copiar el resto del código fuente
COPY . .

# Verificar que Next.js esté disponible y construir la app
RUN npx next --version
RUN npm run build

# Etapa de producción
FROM node:20-alpine AS runner

WORKDIR /app
ENV NODE_ENV=production

# Copiar artefactos del build standalone
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public

# Exponer el puerto 3000 (default de Next.js)
EXPOSE 3000

# Ejecutar la app en modo producción
CMD ["node", "server.js"]