FROM ubuntu:14.04
RUN apt-get update -qqy
RUN apt-get install -qqy openssh-server screen nano sudo psmisc \
 && mkdir -p /var/run/sshd && mkdir -p /root/.ssh \
 && echo 'root:root' | chpasswd \
 && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
 && sed -i 's/#*Port 22/Port 9080/' /etc/ssh/sshd_config
EXPOSE 9080 5901 6001 9443 22 47 1723 500 1701 4500 1194 53 443 80 21 1702 9444 9445 9446 9447 9448 9449 9450 9451 9452 9453
CMD /usr/sbin/cron && /usr/sbin/sshd -D
