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

PROGRAM_NAME="${@}" &&
    dnf update --assumeyes &&
    dnf install --assumeyes $(dnf provides "*bin/${PROGRAM_NAME}" | head --lines 2  | tail --lines 1 | cut --fields 1-2 --delimiter "-") &&
    (cat > /opt/docker/program.sh <<EOF
#!/bin/sh

"${PROGRAM_NAME}" "\${@}"
EOF
    ) &&
    dnf update --assumeyes &&
    dnf clean all