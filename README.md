```
docker pull registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
```

### 日志目录
```
/data/redis/logs/
```

### 默认配置文件
```
/etc/redis.conf
/data/redis/sentinel.conf
```

#### 启动命令示例
**在本机测试需要指定--net网络，同时同一net网络下端口不要相同**
```
docker run -dit -p 6370:6370 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6370 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6371:6371 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6371 -e REDIS_SLAVEOF_IP=192.168.12.2 -e REDIS_SLAVEOF_PORT=6370 -e REDIS_MASTERAUTH=123456 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6372:6372 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6372 -e REDIS_SLAVEOF_IP=192.168.12.2 -e REDIS_SLAVEOF_PORT=6370 -e REDIS_MASTERAUTH=123456 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
```
```
docker run -dit -p 6370:6370 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6370 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6371:6371 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6371 -e REDIS_SLAVEOF_IP=192.168.12.3 -e REDIS_SLAVEOF_PORT=6370 -e REDIS_MASTERAUTH=123456 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6372:6372 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6372 -e REDIS_SLAVEOF_IP=192.168.12.4 -e REDIS_SLAVEOF_PORT=6370 -e REDIS_MASTERAUTH=123456 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
```
```
docker run -dit -p 6370:6370 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6370 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6371:6371 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6371 -e REDIS_SLAVEOF_IP=192.168.12.3 -e REDIS_SLAVEOF_PORT=6370 -e REDIS_MASTERAUTH=123456 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6372:6372 -v /data/redis/logs:/data/redis/logs/ --net host -e START=redis -e REDIS_PORT=6372 -e REDIS_SLAVEOF_IP=192.168.12.4 -e REDIS_SLAVEOF_PORT=6370 -e REDIS_MASTERAUTH=123456 -e REDIS_REQUIREPASS=123456 -e LISTION=IP --privileged  registry.cn-hangzhou.aliyuncs.com/server_repertory/redis:latest
docker run -dit -p 6370:6370 -v /data/redis/logs:/data/redis/logs/ -e START=redis -e REDIS_PORT=6370 -e REDIS_REQUIREPASS=123456 -e LISTION=IP  --privileged  redis
docker run -dit -p 26379:26379 -v /data/redis/logs:/data/redis/logs/ -e START=sentinel -e SENTINEL_LISTION_SERVER_NAME=master -e REDIS_REQUIREPASS=123456 -e SENTINEL_LISTION_SERVER_IP=127.0.0.1 -e SENTINEL_LISTION_SERVER_PORT=6370 -e SENTINEL_QUORUM=2  --privileged  redis
```

#### -e参数列表
|选项|默认值|说明|
|:---|:---|:---|
|START|默认等于redis|意思启动的是redis服务模式，sentinel启动的是哨兵模式|
|REDIS_PORT|默认6370|设置redis的访问端口|
|LISTION|默认等于IP|设置redis的监听方式，默认IP意思是通过ip链接，否则就通过sock方式，默认sock文件/data/redis/redis.sock|
|REDIS_REQUIREPASS|默认0|0意思是不设置,设置redis的访问密码，当启动sentinel，这就是配置sentinel访问master的密码|
|REDIS_SLAVEOF_IP|默认0|0意思是不设置，用于配置当前redis的slaveof ip|
|REDIS_SLAVEOF_PORT|默认0|0意思是不设置，用于配置当前redis的slaveof port |
|REDIS_MASTERAUTH|默认0|0意思是不设置，用于配置当前redis的slaveof 主机的密码 |
|REDIS_BIND_IP|默认0.0.0.0|用于配置redis.conf中的bind项| 
|PROTECTED_MODE|默认no|用于配置redis.conf中的protected-mode项，开启赋值yes| 
||||
|SENTINEL_LISTION_SERVER_NAME|默认等于master|sentinel专用选项：用于配置sentinel monitor监听主机别名|
|SENTINEL_LISTION_SERVER_IP|默认等于master|sentinel专用选项：用于配置sentinel monitor监听主机ip|
|SENTINEL_LISTION_SERVER_PORT|默认等于6379|sentinel专用选项：用于配置sentinel monitor监听主机端口|
|SENTINEL_QUORUM|默认等于2|sentinel专用选项：用于配置sentinel monitor，多少个进程认为不可用即弃用|
|SENTINEL_DOWN_AFTER|默认1000|sentinel专用选项：sentinel down-after-milliseconds PONG监测响应时间范围|
|SENTINEL_FAILOVER|默认1000|sentinel专用选项：用于配置sentinel failover-timeout|


