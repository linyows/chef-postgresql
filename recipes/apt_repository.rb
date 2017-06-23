#
# Cookbook Name:: postgresql
# Recipe:: apt_repository
#

# use `apt.postgresql.org` for primary package installation support
apt_repository node["postgres"]["apt_repository"] do
  uri          node["postgres"]["apt_uri"]
  distribution "#{node["postgres"]["apt_distribution"]}-pgdg"
  components   node["postgres"]["apt_components"]
  key          node["postgres"]["apt_key"]
  keyserver    node["postgres"]["apt_keyserver"]
end

# automatically get repository key updates
package "pgdg-keyring"
