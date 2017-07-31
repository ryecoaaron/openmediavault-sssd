#!/bin/sh
#
# @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    Volker Theile <volker.theile@openmediavault.org>
# @copyright Copyright (c) 2009-2017 Volker Theile
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

. /usr/share/openmediavault/scripts/helper-functions

########################################################################
# Update the configuration.
# <config>
#   <services>
#     <sssd>
#       <enable>0</enable>
#       <host></host>
#       <port>389</port>
#       <enablessl>0</enablessl>
#       <base></base>
#       <rootbinddn></rootbinddn>
#       <rootbindpw></rootbindpw>
#       <usersuffix></usersuffix>
#       <groupsuffix></groupsuffix>
#       <enablepam>0|1</enablepam>
#       <extraoptions></extraoptions>
#       <extraclientoptions></extraclientoptions>
#     </sssd>
#   </services>
# </config>
########################################################################
if ! omv_config_exists "/config/services/sssd"; then
    omv_config_add_node "/config/services" "sssd"
    omv_config_add_key "/config/services/sssd" "enable" "0"
    omv_config_add_key "/config/services/sssd" "host" ""
    omv_config_add_key "/config/services/sssd" "port" "389"
    omv_config_add_key "/config/services/sssd" "enablessl" "0"
    omv_config_add_key "/config/services/sssd" "base" ""
    omv_config_add_key "/config/services/sssd" "rootbinddn" ""
    omv_config_add_key "/config/services/sssd" "rootbindpw" ""
    omv_config_add_key "/config/services/sssd" "usersuffix" "ou=Users"
    omv_config_add_key "/config/services/sssd" "groupsuffix" "ou=Groups"
    omv_config_add_key "/config/services/sssd" "enablepam" "1"
    omv_config_add_key "/config/services/sssd" "extraoptions" ""
    omv_config_add_key "/config/services/sssd" "extraclientoptions" ""
fi

exit 0
