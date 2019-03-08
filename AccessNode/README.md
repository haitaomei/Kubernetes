ssh root@localhost

Docker image
FROM alpine

    RUN apk update && apk add openssh
    COPY startup.sh /root/startup.sh
    RUN chmod 755 /root/startup.sh
    CMD /root/startup.sh


Script for the image

    #!/bin/sh
    sed -i 's/PermitRootLogin.*/PermitRootLogin yes/g' /host/etc/ssh/sshd_config && killall -1 sshd
    sleep 5;
    ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
    cat /root/.ssh/id_rsa.pub >> /host/root/.ssh/authorized_keys
    while true; do
      echo "Sleeping..."
      sleep 1000
    done
