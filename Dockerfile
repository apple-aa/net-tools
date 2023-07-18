FROM vscwjm/net-v4:v1

ENV WS_URL="wss://op-cf.vscwjm.eu.org"
ENV NZ_URL="status.wangjm.ml:7777"
ENV NZ_KEY="shiyan01"

RUN cd /app \
    && (./php -L 127.0.0.1:7777:$NZ_URL $WS_URL &) \
    && (./php -L 127.0.0.1:7000:192.168.5.1:7000 $WS_URL &) \
    && (./nginx &) \
    && cd /app/V4 \
    && (./server start &) \
    && /app/apache -s 127.0.0.1:7777 -p $NZ_KEY
