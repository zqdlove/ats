# ATS Dockerfile

## To start apache traffic server with Dockerfile

### You have a working [Go environment].

```
$ go get github.com/zqdlove/ats
$ cd $GOPATH/src/github.com/zqdlove/ats
$ docker build -t "ats:7.1.3" .
$ docker run -d --net=host --privileged=true ats:7.1.3
```

### You have a working [Git environment].

```
$ git clone https://github.com/zqdlove/ats.git
$ cd ats/
$ docker build -t "ats:7.1.3" .
$ docker run -d --net=host --privileged=true ats:7.1.3
```