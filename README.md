# NodeJs Docker good practices

This repository purpose is to show good practices to keep in mind when creating Dockerfiles for nodeJs applications.

To follow the iterative process of improving the Dockerfile simply checkout the branch for eavery step:

```
git checkout branch step_01
...
git checkout branch step_10
```

## generate the image

```
docker build . --tag dice:1.0
```

## generate the application
```
docker run --rm -p 8080:8080 dice:1.0
```
Navigate to http://localhost:8080 to check the result

