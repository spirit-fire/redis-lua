--usage: /data1/thd/redis/src/redis-cli -h 127.0.0.1 -p 6379 EVAL "$(cat index.lua)" 1 0

--机器ID占4位,左移16位
local pid = KEYS[1]

--获取自增的idx占16位
local idxNum = redis.call("INCR", "ID_IDX") % 65535

--获取当前时间戳(秒),左移20位
local sec = redis.call("TIME")[1]

return sec*1048576+pid*65536+idxNum
