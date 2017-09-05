# fermitools_ubuntu - A docker image with the Fermi science tools under Ubuntu
#
# Stephen Fegan - sfegan@gmail.com - 2017-09-05
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Build version : v1.0

FROM ubuntu:14.04

MAINTAINER sfegan@llr.in2p3.fr

RUN apt-get update                                        && \
    apt-get install -y                                       \
      ipython                                                \
      ipython-notebook                                       \
      python-tk                                              \
      python-matplotlib                                      \
      python-numpy                                           \
      python-scipy

ADD ScienceTools-v10r0p5-fssc-20150518-x86_64-unknown-linux-gnu-libc2.19-0A.tar.gz /usr/local/

ENV FERMI_DIR=/usr/local/ScienceTools-v10r0p5-fssc-20150518-x86_64-unknown-linux-gnu-libc2.19-0/x86_64-unknown-linux-gnu-libc2.19-0

RUN cd $FERMI_DIR                                         && \
    cd BUILD_DIR                                          && \
    ./configure                                           && \
    echo ". $FERMI_DIR/fermi-init.sh" >> $HOME/.bashrc

CMD ["/bin/bash"]
