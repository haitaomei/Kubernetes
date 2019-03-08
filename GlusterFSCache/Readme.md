
export IP1=172.30.215.217
export IP2=172.30.113.165

gluster peer probe ${IP2}

gluster volume create gv0 replica 2 ${IP1}:/glustercache/dv0 ${IP2}:/glustercache/dv0
gluster volume start gv0

mkdir mycache
mount -t glusterfs ${IP1}:/gv0 /mycache

Perform the test
----
time for i in $(seq 1 3000); do dd if=/dev/zero of=$i bs=4K count=1 oflag=dsync ; done

Or

        wget http://www.coker.com.au/bonnie++/bonnie++-1.03e.tgz
        tar zxvf bonnie++-1.03e.tgz
        cd bonnie++-1.03e
        ./configure
        make
        make install
        bonnie++ -d /mycache -r 512 -u root



