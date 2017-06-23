#
# Cookbook Name:: postgresql
# Recipe:: dbg
#

include_recipe "postgresql"

package "postgresql-#{node["postgres"]["version"]}-dbg"
