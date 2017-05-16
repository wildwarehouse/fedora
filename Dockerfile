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
FROM fedora:25
COPY root /opt/docker/
RUN ["/usr/bin/sh", "/opt/docker/run.sh"]
ONBUILD ARG PROGRAM_NAME="bash"
ONBUILD RUN /usr/bin/sh /opt/docker/onbuild.sh $PROGRAM_NAME
ONBUILD USER user
ONBUILD ENTRYPOINT ["/usr/bin/sh", "/opt/docker/entrypoint.sh"]
ONBUILD CMD []