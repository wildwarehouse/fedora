<!--
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
-->
# Synopsis
This is a base fedora image.
It can be used directed or as a base for other images.

In addition to the base fedora image, this image has sudo, docker, and a user 'user'.
By controlling the content of '/usr/local/bin', '/usr/local/sbin', and '/etc/sudoers.d' (by mounting volumes), we can 'inject' applications into the volume.

https://github.com/wildwarehouse/container-injector is a project that will prepare the volumes.

When we run this image as 'user', 'user' can not directly invoke 'docker'.
Instead the user must run a script in '/usr/local/bin' that is allowed (via '/etc/sudoers.d') to run a specific script in '/usr/local/sbin' that run a docker container.

When docker mounts a volume it is ordinarily mounted with root ownership.
We do not know a way to mount a volume other than as owned by root.
This image attempts to provide a way around this.

1. Create a volume.
2. Create a 'user' directory at the top level of the volume.
3. Change the ownership of the 'user' directory to 'user:user'.
4. Add content to the 'user' directory.
5. Mount the volume to '/usr/local/src/{something}'

The image will symbolically link the contents of '/usr/local/src/{something}' to '/home/user/'