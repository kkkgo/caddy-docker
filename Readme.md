# caddy-docker with dns providers
`docker pull sliamb/caddy`  
![pull](https://img.shields.io/docker/pulls/sliamb/caddy.svg) ![size](https://img.shields.io/docker/image-size/sliamb/caddy)   
![Docker Platforms](https://img.shields.io/badge/platforms-linux%2F386%20%7C%20linux%2Famd64%20%7C%20linux%2Farm%2Fv6%20%7C%20linux%2Farm%2Fv7%20%7C%20linux%2Farm64%2Fv8%20-blue)  
一个caddy的docker镜像，集成编译`dns providers`插件，Actions自动编译更新。  
包括以下插件：
```
--with github.com/caddy-dns/cloudflare 
--with github.com/caddy-dns/dnspod 
--with github.com/caddy-dns/tencentcloud 
--with github.com/caddy-dns/alidns 
--with github.com/caddy-dns/acmedns 
--with github.com/caddy-dns/godaddy 
--with github.com/caddy-dns/digitalocean 
--with github.com/caddy-dns/duckdns 
--with github.com/caddy-dns/namecheap 
--with github.com/caddy-dns/dynv6 
--with github.com/caddy-dns/route53
```
有其他需要加的插件可以提。  
caddyfile配置文件：`/data/caddyfile.txt`，建议映射/data目录。  
可用环境变量  
```shell
# 设置时区
TZ=Asia/Shanghai
# 设置容器DNS（解析证书API接口）
DNS=223.5.5.5,8.8.8.8
```

# 示例配置
详情参考 https://blog.03k.org/post/caddy-docker.html