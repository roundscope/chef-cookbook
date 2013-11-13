log_level                :info
log_location             STDOUT
node_name                'deploy'
cookbook_path            './cookbooks'
client_key               'deploy.pem'
validation_client_name   'chef-validator'
validation_key           'chef-validator.pem'
chef_server_url          'https://chef.roundscope.com'
syntax_check_cache_path  '.chef/syntax_check_cache'

