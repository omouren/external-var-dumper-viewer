# external-var-dumper-viewer

Viewer in Vue.js for [ExternalVarDumperBundle](https://github.com/omouren/external-var-dumper-bundle)

![Var Dumper Viewer](https://raw.githubusercontent.com/omouren/external-var-dumper-viewer/master/screenshot.png)

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
$ docker run --rm -p 80:8080 -ti omouren/external-var-dumper-viewer:latest
# You can override it with custom port by an environment variable
$ docker run --rm -e "PORT=1337" -p 80:1337 -ti omouren/external-var-dumper-viewer:latest
# Now go to http://localhost:80
```
