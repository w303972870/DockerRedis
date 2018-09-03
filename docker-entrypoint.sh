#!/usr/bin/env sh
if [ "$START" == "redis" ]; then

    if [ "$LISTION" == "IP" ]; then
        sed -i "s/unixsocket \/run\/redis\/redis.sock/#unixsocket \/run\/redis\/redis.sock/g" /etc/redis.conf ;
        sed -i "s/unixsocketperm 770/#unixsocketperm 770/g" /etc/redis.conf ;
    else
        sed -i "s/unixsocket \/run\/redis\/redis.sock/unixsocket \/data\/redis\/redis.sock/g" /etc/redis.conf ;        
    fi

    sed -i "s/bind 127\.0\.0\.1/bind $REDIS_BIND_IP/g" /etc/redis.conf ;
    sed -i "s/port 6379/port $REDIS_PORT/g" /etc/redis.conf ;
    sed -i "s/\/var\/log\/redis\/redis\.log/\/data\/redis\/logs\/redis\.log/g" /etc/redis.conf ;
    if [ "$REDIS_REQUIREPASS" != "0" ]; then
        echo 1;
        sed -i "s/\# requirepass foobared/requirepass $REDIS_REQUIREPASS/g" /etc/redis.conf ;
    fi
    if [ "$REDIS_MASTERAUTH" != "0" ]; then
        sed -i "s/\# masterauth \<master-password\>/masterauth $REDIS_MASTERAUTH/g" /etc/redis.conf ;
    fi
    
    if [ "$REDIS_SLAVEOF_IP" != "0" ]; then
        if [ "$REDIS_SLAVEOF_PORT" != "0" ]; then
            sed -i "s/\# slaveof \<masterip\> \<masterport\>/slaveof $REDIS_SLAVEOF_IP $REDIS_SLAVEOF_PORT/g" /etc/redis.conf ;
        fi
    fi
    redis-server /etc/redis.conf
else
    sed -i "s/\$SENTINEL_LISTION_SERVER_NAME/$SENTINEL_LISTION_SERVER_NAME/g" /data/redis/sentinel.conf
	sed -i "s/\$SENTINEL_LISTION_SERVER_IP/$SENTINEL_LISTION_SERVER_IP/g" /data/redis/sentinel.conf
	sed -i "s/\$SENTINEL_LISTION_SERVER_PORT/$SENTINEL_LISTION_SERVER_PORT/g" /data/redis/sentinel.conf
	sed -i "s/\$SENTINEL_QUORUM/$SENTINEL_QUORUM/g" /data/redis/sentinel.conf
	sed -i "s/\$SENTINEL_DOWN_AFTER/$SENTINEL_DOWN_AFTER/g" /data/redis/sentinel.conf
	sed -i "s/\$SENTINEL_FAILOVER/$SENTINEL_FAILOVER/g" /data/redis/sentinel.conf
	sed -i "s/\$REDIS_REQUIREPASS/$REDIS_REQUIREPASS/g" /data/redis/sentinel.conf

	redis-server /data/redis/sentinel.conf --sentinel

fi