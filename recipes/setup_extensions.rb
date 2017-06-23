#
# Cookbook Name:: postgresql
# Recipe:: setup_extensions
#

include_recipe "postgres::contrib"

# setup database extensions
node["postgres"]["extensions"].each do |ext|
  ext_action = (ext["action"] || "create").to_sym

  postgresql_extension ext["name"] do
    database ext["database"]
    action ext_action
  end
end
