#
# Cookbook Name:: postgresql
# Resource:: extension
#

actions :create, :drop

default_action :create

attribute :name,       kind_of: String, name_attribute: true
attribute :database,   kind_of: String
attribute :db_version, kind_of: String, default: node["postgres"]["version"]

attr_accessor :exists
