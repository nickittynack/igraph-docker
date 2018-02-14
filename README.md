This repository is a simple wrapper around [Junto](https://github.com/parthatalukdar/junto).

Building the Image
===============================
```
docker build -t igraph:latest .
docker run -i -t igraph:latest /bin/bash
```


Running the Junto Sample
===============================
```
cd examples/simple/
junto config simple_config
cat data/label_prop_output
```
