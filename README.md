A [Docker](https://www.docker.com/) container with

- node 10.x
- chrome for karma headless testing


```bash
# run it

$ docker run -it -v $(pwd):/src -w /src -e NODE_ENV=CI nitro/node-karma npm -v
Starting virtual X frame buffer: Xvfb.
...
```
