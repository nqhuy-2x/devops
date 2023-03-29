#kiểm tra phiên bản
docker --version

#liệt kê các image
docker images -a

#xóa một image (phải không container nào đang dùng)
docker images rm imageid

#tải về một image (imagename) từ hub.docker.com
docker pull nginx

#xem info images
docker inspect mysql:5.7 > images-mysql.txt

#liệt kê các container
docker container ps -a

#xóa container
docker container rm containerid

#tạo mới một container
docker run -it nginx 
docker run -d -P nginx
docker run -d -P mysql:5.7
docker run -d -P -e MYSQL_ROOT_PASSWORD=abcd.1234 mysql:5.7

#thoát termial vẫn giữ container đang chạy
CTRL +P, CTRL + Q

#Vào termial container đang chạy
docker container attach containerid

#Chạy container đang dừng
docker container start -i containerid

#Chạy một lệnh trên container đang chạy
docker exec -it containerid command

#Build docker image
docker build -t nanoimg:V2 .

#Run container from image
sudo docker run -d --name nanowebsite -p 9080:80 nanoimg

#Tao account docker hub
#Tag image theo repo tren docker hub
docker tag kiettt2-tcb/nanoimg:latest kiettran164/kiettt2-tcb:v1

#Login docker
docker Login

#push image to docker hub
docker push

#Kiem tra thong tin container
docker inspect nanowebsite > nanoweb.txt

#Check logs container
docker logs nanowebsite

#Tao db voi name vprodb
docker run --name vprodb -d -e MYSQL_ROOT_PASSWORD=abcd.1234 -p 3030:3306 -v /home/admin/PROJECT/vprodbdata:/var/lib/mysql mysql:5.7

#Truy cap vao container
docker exec -it vprodb /bin/bash

#Tao volume cho container
docker volume create mydbdata

#Check list volume
docker volume ls

#Tao lai mysql container voi volume mydbdata
docker run --name vprodb -d -e MYSQL_ROOT_PASSWORD=abcd.1234 -p 3030:3306 -v mydbdata:/var/lib/mysql mysql:5.7

#check data cua mysql container tren server
sudo -i
ls /var/lib/docker/volumes/mydbdata/
ls /var/lib/docker/volumes/mydbdata/_data/

#xem info mysql container
docker inspect vprodb > vprodb.txt

#truy cap vao mysql container
sudo apt install mysql-client-core-5.7 -y
mysql -h 172.17.0.2 -u root -pabcd.1234










