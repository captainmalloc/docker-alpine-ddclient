FROM alpine:3.9

RUN DDCLIENT_VERSION="latest" && \
	DDCLIENT_BASE_URL="https://sourceforge.net/projects/ddclient/files" && \
	DDCLIENT_REL_URL="${DDCLIENT_BASE_URL}/${DDCLIENT_VERSION}/download" && \
	apk add wget unzip make perl perl-utils perl-test-taint perl-netaddr-ip \
	perl-net-ip perl-yaml perl-log-log4perl perl-io-socket-ssl && \
	cpan Data::Validate::IP && \
	wget -q -O ddclient.zip ${DDCLIENT_REL_URL} && \
	unzip ddclient.zip && \
	rm ddclient.zip && \
	\
	mv ddclient-*/ddclient /usr/sbin/ && \
	mkdir /etc/ddclient && \
	mkdir /var/cache/ddclient/ && \
	mv ddclient-*/sample-etc_ddclient.conf /etc/ddclient/ddclient.conf && \
	mv ddclient-*/sample-etc_rc.d_init.d_ddclient.alpine /etc/init.d/ddclient && \
	\
	rm -r ddclient-*
