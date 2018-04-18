# https://github.com/schemacrawler/SchemaCrawler/releases

FROM java:8
MAINTAINER Ryan Chatterton <ryan.chatterton@sharpnotions.com>

ARG SCHEMACRAWLER_VERSION

# Install GraphViz
RUN \
    apt-get update \
 && apt-get install -y graphviz \
 && rm -rf /var/lib/apt/lists/*

# Download SchemaCrawler and prepare install directories
RUN \
    wget -nv https://github.com/schemacrawler/SchemaCrawler/releases/download/v"$SCHEMACRAWLER_VERSION"/schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution.zip \
    && unzip -q schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution.zip \
    && mv schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution/_schemacrawler schemacrawler \
    && rm schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution.zip \
    && rm -rf schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution

# Setup directories
WORKDIR /schemacrawler
VOLUME /output

ENTRYPOINT ["./schemacrawler.sh"]
