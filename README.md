A [Docker](https://www.docker.com/) container with

- node 8.x
- chrome for karma headless testing
- bower is included


```bash
# run it

$ docker run -it -v $(pwd):/src -w /src -e NODE_ENV=CI nitro/node-karma npm -v
Starting virtual X frame buffer: Xvfb.
...
```
