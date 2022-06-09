#/bin/bash

#
# Launch and IOC locally using podman or docker
#
# launces the IOC in a local container connected to the host NIC so that
# caget from the same host will work.

# this mounts the ioc instance's bin volume using -v=source:target
# wheras on the k8s cluster this will be done with a config map

if [ -z "${1}" ]
then
    echo 'usage ioc-launch <ioc-chart-root-folder>
        launches the ioc in a local container for debugging purposes
    '
    exit 1
fi

ioc=$(realpath ${1})

if [ -z $(which podman 2> /dev/null) ]
then
    # use docker if we dont see podman installed
    shopt -s expand_aliases
    alias podman='docker'
fi

function addvol ()
{
  vols=$vols" --mount type=bind,source=${1},destination=${2},bind-propagation=rslave,z"
}

command="bash /repos/epics/ioc/config/start.sh"
image=$(awk '/base_image/{print $NF}' ${ioc}/values.yaml)

addvol /scratch/hgv27681/work/epics-containers/bl45p/iocs/bl45p-ea-ioc-01/config /repos/epics/ioc/config

if [ "${ioc_dev}" ] ; then
    # remove .run from the image name to get developer image
    image=${image%.run}
fi

echo "launching container ${image} with ${command}"
set -x
podman run -it --network host ${vols} ${image} ${command}

