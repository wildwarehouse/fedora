#!/bin/sh

# This file is part of fedora.
#
#    chown is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    chown is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with chown .  If not, see <http://www.gnu.org/licenses/>.

ls -1 /usr/local/src | while read ALPHA
do
    ls -1 "/usr/local/src/${ALPHA}/user" | while read BETA
    do
        ln --symbolic --force "/usr/local/src/${ALPHA}/user/${BETA}" "/home/user/${BETA}"
    done
done &&
    /usr/bin/sh /opt/docker/program.sh "${@}"
