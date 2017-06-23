#
# Cookbook Name:: postgresql
# Recipe:: configuration
#

pg_version = node["postgres"]["version"]
restart_action = node["postgres"]["cfg_update_action"].to_sym

directory "/etc/postgresql/#{pg_version}/main/" do
  owner  "postgres"
  group  "postgres"
  recursive true
end

# environment
template "/etc/postgresql/#{pg_version}/main/environment" do
  source "environment.erb"
  owner  "postgres"
  group  "postgres"
  mode   "0644"
  notifies restart_action, "service[postgresql]"
end

# pg_ctl
template "/etc/postgresql/#{pg_version}/main/pg_ctl.conf" do
  source "pg_ctl.conf.erb"
  owner  "postgres"
  group  "postgres"
  mode   "0644"
  notifies restart_action, "service[postgresql]"
end

# pg_hba
template node["postgres"]["hba_file"] do
  source "pg_hba.conf.erb"
  owner  "postgres"
  group  "postgres"
  mode   "0640"
  notifies :reload, "service[postgresql]"
  sensitive true
end

# pg_ident
template node["postgres"]["ident_file"] do
  source "pg_ident.conf.erb"
  owner  "postgres"
  group  "postgres"
  mode   "0640"
  notifies :reload, "service[postgresql]"
  sensitive true
end

# postgresql
if node["postgres"]["conf_custom"]
  file "/etc/postgresql/#{pg_version}/main/postgresql.conf" do
    content node["postgres"]["conf"].map { |k, v| "#{k} = '#{v}'" }.join("\n")
    owner  "postgres"
    group  "postgres"
    mode   "0644"
    notifies restart_action, "service[postgresql]"
  end
else
  template "/etc/postgresql/#{pg_version}/main/postgresql.conf" do
    source "postgresql.conf.erb"
    owner  "postgres"
    group  "postgres"
    mode   "0644"
    notifies restart_action, "service[postgresql]"
  end
end

# start
template "/etc/postgresql/#{pg_version}/main/start.conf" do # ~FC037 variable ok
  source "start.conf.erb"
  owner  "postgres"
  group  "postgres"
  mode   "0644"
  notifies restart_action, "service[postgresql]", :immediately
end
