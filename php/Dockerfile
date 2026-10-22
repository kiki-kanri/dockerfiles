# syntax=docker/dockerfile

# Set args
ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm-trixie

# Install packages and extensions in one layer.
ADD --chmod=0700 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
COPY ./extensions.txt /tmp/extensions.txt
RUN \
    ## Base
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends acl ca-certificates git gosu mold supervisor tini tzdata unzip vim && \
    \
    ## Node
    curl -fsSL https://deb.nodesource.com/setup_26.x -o /tmp/nodesource-setup.sh && \
    bash /tmp/nodesource-setup.sh && \
    rm /tmp/nodesource-setup.sh && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm upgrade -g && \
    npm i -g npm@latest pnpm@latest yarn@latest && \
    npm cache clean -g --force && \
    \
    ## PHP Extensions
    # Shared modules need PIC; do not inherit the PHP executable's PIE flags.
    export CPPFLAGS='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=3' && \
    # The PECL installer overrides CPPFLAGS, so keep these defines in C/CXXFLAGS too.
    export CFLAGS="-O2 -fPIC -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security ${CPPFLAGS}" && \
    export CXXFLAGS="${CFLAGS} -D_GLIBCXX_ASSERTIONS" && \
    export LDFLAGS='-fuse-ld=mold -Wl,-O1 -Wl,-z,relro,-z,now -Wl,-z,noexecstack' && \
    EXTENSIONS="$(sed -E 's/#.*$//; /^\s*$/d' /tmp/extensions.txt | xargs)" && \
    install-php-extensions ${EXTENSIONS} && \
    \
    ## Debug extensions (installed but disabled; downstream can enable either one)
    IPE_DONT_ENABLE=1 install-php-extensions xdebug pcov && \
    \
    ## Cleanup
    apt-get remove -y mold && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# Apply runtime defaults after extension installation so edits reuse build layers.
COPY --chmod=0644 ./security.ini /usr/local/etc/php/conf.d/50-security.ini
COPY --chmod=0644 ./security-fpm.conf /usr/local/etc/php-fpm.d/50-security.conf

# Timezone
ONBUILD ARG TZ
ONBUILD ENV TZ="${TZ}"
ONBUILD RUN ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime && \
            echo "${TZ}" >/etc/timezone
