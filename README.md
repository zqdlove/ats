# ATS Dockerfile

### To start apache traffic server with Docker

#### You have a working [Go environment].

```
$ go get github.com/zqdlove/ats
$ cd $GOPATH/src/github.com/zqdlove/ats
$ docker build -t "ats:7.1.6" .
$ docker run -d --net=host --privileged=true ats:7.1.6
```

#### You have a working [Git environment].

```
$ git clone https://github.com/zqdlove/ats.git
$ cd ats/
$ docker build -t "ats:7.1.6" .
$ docker run -d --net=host --privileged=true ats:7.1.6
```

#### You have a working [Docker environment].

```
$ docker pull zqdlove/ats
$ docker run -d --net=host --privileged=true zqdlove/ats
```
