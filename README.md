# external-var-dumper-viewer

[![Build Status](https://travis-ci.org/omouren/external-var-dumper-viewer.svg?branch=master)](https://travis-ci.org/omouren/external-var-dumper-viewer)

Viewer in Vue.js for [ExternalVarDumperBundle](https://github.com/omouren/external-var-dumper-bundle)

## Build Setup

``` bash
# install dependencies
$ npm install

# serve with hot reload at localhost:8080
$ npm run dev
```

## Docker image
Pre-built [Docker image](https://hub.docker.com/r/omouren/external-var-dumper-viewer/)
``` bash
# By default, internaly server use port 8080
$ docker run -p 80:8080 -ti omouren/external-var-dumper-viewer:latest
# You can override it with custom port by an environment variable
$ docker run -e "PORT=1337" -p 80:1337 -ti omouren/external-var-dumper-viewer:latest
# Now go to http://localhost:80
```
