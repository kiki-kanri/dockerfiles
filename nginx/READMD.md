# Base nginx and image (use alpine).

This is the default nginx config.
```
user nginx;
worker_processes 1;
worker_rlimit_nofile 65535;
pid /run/nginx.pid;

events {
    use epoll;
    worker_connections 1024;
}

http {
    # Base settings
    add_header X-Frame-Options "DENY";
    charset utf-8;
    default_type application/octet-stream;
    keepalive_timeout 60;
    output_buffers 4 16k;
    postpone_output 1024;
    sendfile on;
    server_names_hash_bucket_size 256;
    server_tokens off;
    tcp_nodelay on;
    tcp_nopush on;
    types_hash_max_size 4096;

    # Log
    access_log off;
    error_log off;

    # Other config
    include /etc/nginx/mime.types;

    # Main
    server {
        listen 80;
        server_name _;
        root /app;
        index index.html;

        location / {
            try_files $uri $uri/ /index.html;
        }
    }
}
```
