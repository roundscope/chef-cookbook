log_level                :info
log_location             STDOUT

cookbook_path            '../cookbooks'

node_name                'deploy'
client_key               'deploy.pem'

validation_client_name   'chef-validator'
validation_key           'chef-validator.pem'

chef_server_url          'https://chef.roundscope.com'
syntax_check_cache_path  'syntax_check_cache'
