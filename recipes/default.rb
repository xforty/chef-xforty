#
# Cookbook Name:: xforty
# Recipe:: default
#
# Copyright 2011, xforty technologies
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Platform-specific configuration
case node["platform"]
when "centos", "redhat", "fedora"
  include_recipe "rpmforge"
  include_recipe "selinux::disabled"
when "debian", "ubuntu"
  # make sure apt package cache is up-to-date
  execute "apt-get-update" do
    command "apt-get update"
  end
  
  # set up apt
  include_recipe "apt"
end

# Include common software
include_recipe "vim"
package "strace"
package "unzip"
package "avahi-daemon"

# Restart avahi so any changes during install are picked up
service "avahi-daemon" do
  action [ :enable, :restart ]
end
