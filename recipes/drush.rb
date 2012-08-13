# 
# Author:: David King <dking@xforty.com>
# Cookbook Name:: xforty
# Recipe:: drush
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

include_recipe "drush"

# Drush make could use any of these tools. Add them here just in case.
include_recipe "git"
include_recipe "subversion"
package "bzr"
package "wget"
package "curl"
package "tar"
package "gzip"
package "zip"

# If we are in a vagrant environment and a .drush folder exists,
# symlink it to vagrant user's home directory.
link "/home/vagrant/.drush" do
  to "/vagrant/.drush"
  only_if "test -d /vagrant/.drush"
end
