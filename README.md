Quickstart
----------

The following steps will deploy Noah to Cloud Foundry using fully autogenerated names. See the vmc documentation for how to customize those.

	gem install vmc
	gem install bundler
	vmc target api.cloudfoundry.com
	vmc login

	vmc create-service redis -n
	# note the auto-generated name
	bundle install
	bundle package
	vmc push sample-noah-deploy --no-start -n --runtime ruby19
	vmc bind-service <auto-generated-servicename> sample-noah-deploy
	vmc start sample-noah-deploy
	vmc files sample-noah-deploy logs/stderr.log
	vmc apps
	# note your url
	curl -X PUT -d '{"name":"noah-on-cloudfoundry"}' http://your-url/applications/noah-on-cloudfoundry
	curl http://your-url/applications/noah-on-cloudfoundry
	# {"id":"1","name":"noah-on-cloudfoundry","created_at":"2011-04-15 04:39:59 UTC","updated_at":"2011-04-15 04:39:59 UTC","configurations":[]}
