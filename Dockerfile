FROM node:alpine as reactapp
WORKDIR /app
COPY package.json . 
RUN npm i
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=reactapp /app/build /usr/share/nginx/html

# NGIX HAS DEFAULT COMMAND IN IMG - SO NEED NEED HERE





