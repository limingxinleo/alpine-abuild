# Abuild 密钥生成器

```
# 构建镜像
$ docker-compose build sandbox

# 运行生成器
$ docker-compose run sandbox abuild-keygen -a -i
>>> Generating public/private rsa key pair for abuild
Enter file in which to save the key [/home/sandbox/.abuild/-5de4b793.rsa]: /home/sandbox/.abuild/limingxinleo.rsa
Generating RSA private key, 2048 bit long modulus (2 primes)
....+++++
........................................+++++
e is 65537 (0x010001)
writing RSA key
>>> Installing /home/sandbox/.abuild/limingxinleo.rsa.pub to /etc/apk/keys...
>>> 
>>> Please remember to make a safe backup of your private key:
>>> /home/sandbox/.abuild/limingxinleo.rsa
>>> 
```