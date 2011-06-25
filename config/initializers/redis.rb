require 'redis'
c = YAML.load_file("#{::Rails.root.to_s}/config/redis.yml")[::Rails.env]
redis_config = { :host => c['host'], :port => c['port'], :password => c['password'], :db => c['db'] }

$db = Redis.new(redis_config)
