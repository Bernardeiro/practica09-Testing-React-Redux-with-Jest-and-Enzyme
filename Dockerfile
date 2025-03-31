# Imagen base oficial de Node
FROM node:18

# Directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copia los archivos del proyecto
COPY . .

# Instala dependencias
RUN yarn install

# Expone el puerto 3000
EXPOSE 3000

# Comando para arrancar la app
CMD ["yarn", "start"]

