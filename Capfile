load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks

require 'capistrano/ext/multistage'
require 'rvm/capistrano'
require "delayed/recipes"
require "bundler/capistrano"
load 'deploy/assets'

require 'capistrano/server_definition'
require 'capistrano/role'
class Capistrano::Configuration
  def role_names_for_host(host)
    roles.map {|role_name, role| role_name if role.include?(host) }.compact || []
  end
end
