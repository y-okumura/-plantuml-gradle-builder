plantuml-gradle-builder
=======================

Build [plantuml](http://plantuml.com/ ) (.puml) files by gradle on docker.

setup
-----

1. Run command:
```sh
docker build . -t plantuml-gradle-builder
```

usage
-----

1. Create your project dir.(e.g. `prj/`)
1. Copy build.gradle into `prj/` dir.
1. Make `prj/src/` dir.
1. Put `.puml` files into `prj/src/` dir.
1. Run command:
```sh
docker run -v "$PWD":/home/gradle/prj -w /home/gradle/prj plantuml-gradle-builder
```
1. Get png files in `prj/build/` dir.
