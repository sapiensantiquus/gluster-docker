#!/bin/bash -v
set -m
glusterd -N &
sleep 10
if [[ "$HOST" = "$MASTER" ]]
then
        for node in $NODES
        do
                gluster peer probe $node
        done
        gluster volume create swarm-vols replica $NODE_NUM $NODE_MAPPINGS force
fi
mount.glusterfs localhost:/swarm-vols /swarm/volumes
fg 

