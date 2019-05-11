# Alpine 3.9 with DDClient

This small project builds a custom Docker image based on *alpine:3.9* integrating
a [DDclient](https://github.com/ddclient/ddclient "DDClient on GitHub") init script.

## Usage

Build a custom image using *docker*

```bash
docker build --tag=captainmalloc/alpine_ddclient .
```

or use the one available on [DockerHub](https://hub.docker.com "Docker Hub")

```bash
docker pull captainmalloc/alpine_ddclient
```

A sample DDClient configuration is already available in */etc/ddclient/sample-etc_ddclient.conf*
as a reference. A custom DDClient configuration needs to be installed in **/etc/ddclient/ddclient.conf**:

```bash
docker run -t -d -v ~/ddclient.conf:/etc/ddclient/ddclient.conf captainmalloc/alpine_ddclient
```

### DDClient example configuration

```
daemon=600                              # check every 300 seconds
syslog=yes                              # log update msgs to syslog
mail=root                               # mail all msgs to root
mail-failure=root                       # mail failed update msgs to root
pid=/var/run/ddclient.pid               # record PID in file.
ssl=yes                                 # use ssl-support.  Works with
                                        # ssl-library		
## To obtain an IP address from Web status page (using the proxy if defined)
## by default, checkip.dyndns.org is used if you use the dyndns protocol. 
## Using use=web is enough to get it working.
## WARNING: set deamon at least to 600 seconds if you use checkip or you could
## get banned from their service.
use=web,

##
## Google Domains (www.google.com/domains)
##
protocol=googledomains,   
login='my_username',
password='my_password',
www.domain.tld,
```

## Release Notes

### Patch 1 (2019-05-11)

Fix *docker run* command to execute detached and in background.

### Initial Revision (2019-05-11)

Alpine 3.9 + DDClient 3.9
