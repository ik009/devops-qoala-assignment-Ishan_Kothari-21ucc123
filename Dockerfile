FROM nginx:latest
COPY nginx/nginx.conf /etc/nginx/nginx.conf
# COPY nginx/.html /usr/share/nginx/html
# EXPOSE "eighty"
EXPOSE 80
CMD ["nginx", "-g", "daemon of;"]
