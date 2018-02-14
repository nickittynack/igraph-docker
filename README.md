Building the Image
===============================
This is going to take a while, it's going to compile igraph to the latest version as the versions on pypy are out of date.
```
docker build -t igraph:latest .
```

Running the Image
===============================
This is going to spin up our jupyter interface, with workspace being a shared folder between your machine and Docker. If you're on a Windows box the below wont work, you'll need to switch `"$(pwd)/workspace"` to the path of the folder.
```
docker run -i -p 4040:8888 -v "$(pwd)/workspace":/workspace -t igraph:latest
```
After running the command you should see some information about tokens, you can now open up a browser to localhost:4040 and you should see jupyter. Copy paste in the token.