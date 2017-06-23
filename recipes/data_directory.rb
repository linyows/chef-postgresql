#
# Cookbook Name:: postgresql
# Recipe:: data_directory
#

# ensure data directory exists
directory node["postgres"]["data_directory"] do
  owner  "postgres"
  group  "postgres"
  mode   "0700"
  recursive true
  not_if { ::File.exist?("#{node["postgres"]["data_directory"]}/PG_VERSION") }
end

# initialize the data directory if necessary
bash "postgresql initdb" do
  user "postgres"
  code <<-EOC
  /usr/lib/postgresql/#{node["postgres"]["version"]}/bin/initdb \
    #{node["postgres"]["initdb_options"]} \
    -U postgres \
    -D #{node["postgres"]["data_directory"]}
  EOC
  not_if { ::File.exist?("#{node["postgres"]["data_directory"]}/PG_VERSION") }
end
