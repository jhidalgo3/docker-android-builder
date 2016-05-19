Usage
-----

Build Image

```
docker build -t android-builder .
```

Build an android project

```
docker run -v $PWD:/opt/workspace -v $PWD/.gradle:/root/.gradle android-builder ./gradlew build
```
