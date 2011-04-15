require 'sinatra'
require 'rack'
require 'thin'
require 'noah'
require 'ohm'

vcap_services = JSON.load(ENV['VCAP_SERVICES'])
redis_host = vcap_services["redis-2.2"][0]["credentials"]["hostname"]
redis_port = vcap_services["redis-2.2"][0]["credentials"]["port"]
redis_password = vcap_services["redis-2.2"][0]["credentials"]["password"]
app_ip = vcap_services['VMC_APP_HOST']
app_port = vcap_services['VMC_APP_PORT']

Ohm.connect(:host => redis_host, :port => redis_port, :password => redis_password)
server = ::Rack::Server.new()
server.instance_variable_set('@config', 'config.ru' )
server.start
