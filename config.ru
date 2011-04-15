require 'rubygems'
require 'thin'
require 'noah'

vcap_services = JSON.load(ENV['VCAP_SERVICES'])
redis_host = vcap_services["redis-2.2"][0]["credentials"]["hostname"]
redis_port = vcap_services["redis-2.2"][0]["credentials"]["port"]
redis_password = vcap_services["redis-2.2"][0]["credentials"]["password"]
app_ip = vcap_services['VMC_APP_HOST']
app_port = vcap_services['VMC_APP_PORT']
ENV['REDIS_URL'] = "redis://#{redis_host}:#{redis_port}/0"

noah = Noah::App.new do
  set :redis_url, "redis://#{redis_host}:#{redis_port}/0"
  set :server, 'thin'
  set :run, false
end
run noah
