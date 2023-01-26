#!/bin/bash

# 1. Membuat Docker image dari Dockerfile yang dibuat sebelumnya
# docker build -t item-app:v1 . #saya komentari karena docker image sudah di buat di tahap sebelumnya

# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
docker tag item-app:v1 irfansettz/item-app:v1

# 4. Login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u irfansettz --password-stdin

# 5. Mengunggah image ke Docker Hub
docker push irfansettz/item-app:v1
