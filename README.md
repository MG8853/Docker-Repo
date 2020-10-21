Dockerの一覧表示
docker images

Tagなどリンク作成＆設定
docker tag < image-id > < repository >

Push！
docker push < repository >




注意！

![](https://i.gyazo.com/ee2c5b582659aa03696e56e5d4bebb5b.png)

CRLFではなく

![](https://i.gyazo.com/b6b16545db760b583d458a94e29c273a.png)

LFで書かないと

例：cd /home/container\r

となることがある！