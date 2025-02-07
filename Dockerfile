# Usa Node.js 22 como base
FROM node:22

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos esenciales
COPY package.json package-lock.json ./

# Instala las dependencias sin incluir las de desarrollo
RUN npm install --omit=dev

# Copia el resto del código fuente
COPY . .

# Copia el archivo .env para la configuración
COPY .env .env

# Expone los puertos REST y GraphQL
EXPOSE 5002 4002

# Comando para ejecutar el servidor
CMD ["node", "src/server.js"]
