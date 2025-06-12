/** @type {import('next').NextConfig} */
const nextConfig = {
  // 1️⃣ Añadido para generar el build standalone
  output: 'standalone',

  // tu configuración existente
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: true, // si no usas loader personalizado
  },
  experimental: {
    webpackBuildWorker: true,
    parallelServerBuildTraces: true,
    parallelServerCompiles: true,
    allowedDevOrigins: process.env.ALLOWED_DEV_ORIGINS
      ? process.env.ALLOWED_DEV_ORIGINS.split(',')
      : [],
  },
}

// Cargar configuración extra opcional
let userConfig = {}
try {
  userConfig = require('./v0-user-next.config')
} catch (e) {
  // archivo opcional
}

// Función de merge (la dejas igual)
function mergeConfig(base, override) {
  for (const key in override) {
    if (typeof base[key] === 'object' && !Array.isArray(base[key])) {
      base[key] = { ...base[key], ...override[key] }
    } else {
      base[key] = override[key]
    }
  }
  return base
}

module.exports = mergeConfig(nextConfig, userConfig)
