# zen latest

FROM ubuntu:xenial

ENV BUILD_PACKAGES="build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake" \
		RUNTIME_PACKAGES="libgomp1"

RUN \
	apt-get update && apt-get install -y $BUILD_PACKAGES $RUNTIME_PACKAGES && \
	cd ~ && git clone https://github.com/zencashio/zen.git && cd ~/zen && \
	git checkout v.2.0.8-4 && ./zcutil/build.sh -j$(nproc) && cd ~/zen/src && \
	cp zend zen-cli zen-gtest zen-tx /usr/local/bin/ && cd ~ && rm -rf zen && \
	apt-get remove --purge -y $BUILD_PACKAGES $(apt-mark showauto) && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 8231/tcp 9033/tcp
VOLUME [ "/root/.zen", "/root/.zcash-params" ]
ENTRYPOINT [ "/usr/local/bin/zend" ]
