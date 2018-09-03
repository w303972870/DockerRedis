### 日志目录
```
/data/redis/logs/
```
#### 启动命令示例
```
docker run -d --name redis-01 -p 6371:6370 registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -d --name redis-02 -p 6372:6370 registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -d --name redis-03 -p 6373:6370 registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -d --name redis-04 -p 6374:6370 -e REDIS_PASSWORD=123456 registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -d --name redis-05 -e LISTION=SOCK -e REDIS_PASSWORD=123456 registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
```

#### -e参数列表


|START|默认等于redis|意思启动的是redis服务|
|REDIS_PORT|默认6370|设置redis的访问端口|
|LISTION|默认等于IP|设置redis的监听方式，默认IP意思是通过ip链接，否则就通过sock方式，默认sock文件/data/redis/redis.sock|
|REDIS_REQUIREPASS|默认0|0意思是不设置,设置redis的访问密码，当启动sentinel，这就是配置sentinel访问master的密码|
|REDIS_SLAVEOF_IP|默认0|0意思是不设置，用于配置当前redis的slaveof ip|
|REDIS_SLAVEOF_PORT|默认0|0意思是不设置，用于配置当前redis的slaveof port |
|REDIS_BIND_IP|默认0.0.0.0|用于配置redis.conf中的bind项| 
||||
|SENTINEL_LISTION_SERVER_NAME|默认等于master|sentinel专用选项：用于配置sentinel monitor监听主机别名|
|SENTINEL_LISTION_SERVER_IP|默认等于master|sentinel专用选项：用于配置sentinel monitor监听主机ip|
|SENTINEL_LISTION_SERVER_IP_PORT|默认等于6379|sentinel专用选项：用于配置sentinel monitor监听主机端口|
|SENTINEL_QUORUM|默认等于2|sentinel专用选项：用于配置sentinel monitor，多少个进程认为不可用即弃用|
|SENTINEL_DOWN_AFTER|默认1000|sentinel专用选项：sentinel down-after-milliseconds PONG监测响应时间范围|
|SENTINEL_FAILOVER|默认1000|sentinel专用选项：用于配置sentinel failover-timeout|


