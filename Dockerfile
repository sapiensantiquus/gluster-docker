FROM arm32v7/debian:jessie-20170907
RUN apt-get update && apt-get install -y glusterfs-server glusterfs-client &&  mkdir -p /gluster/data /swarm/volumes
ADD bootstrap.sh /bootstrap.sh
RUN chmod u+x /bootstrap.sh
CMD ["/bootstrap.sh"]

