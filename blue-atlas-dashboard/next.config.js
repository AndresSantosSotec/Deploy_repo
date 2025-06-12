/** @type {import('next').NextConfig} */
const nextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: true, // lo puedes ajustar si usas un loader
  },
  experimental: {
    webpackBuildWorker: true,
    parallelServerBuildTraces: true,
    parallelServerCompiles: true,
    allowedDevOrigins: process.env.ALLOWED_DEV_ORIGINS
      ? process.env.ALLOWED_DEV_ORIGINS.split(',')
      : [],
  },

  // 🔴 IMPORTANTE: NO pongas output: 'export'
  // Esto rompe rutas dinámicas como /firma/student-details/[id]
  // output: 'export', ← ¡NO LO USES AQUÍ!
}

// Cargar configuración extra opcional
let userConfig = {}
try {
  userConfig = require('./v0-user-next.config')
} catch (e) {
  // archivo opcional
}

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
