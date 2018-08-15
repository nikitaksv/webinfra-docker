#!/usr/bin/env bash
echo "---------------> redis local host => redis container host"
find /usr/local/bundle/gems/redis-4.0.2/lib/redis/client.rb -type f -exec sed -i 's/127.0.0.1/redis/g' {} \;
cat /usr/local/bundle/gems/redis-4.0.2/lib/redis/client.rb
echo "---------------> Fixed redis ip"
