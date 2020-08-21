FROM golang:1.11.2

ENV GO111MODULE=off

RUN go get k8s.io/code-generator; exit 0
RUN go get k8s.io/apimachinery; exit 0

RUN cd $GOPATH/src/k8s.io/code-generator && go get ./...
RUN cd $GOPATH/src/k8s.io/apimachinery && go get ./...
#RUN go get k8s.io/gengo; exit 0
#RUN go get github.com/spf13/pflag; exit 0
#RUN go get golang.org/x/tools/imports; exit 0
#RUN go get golang.org/x/mod/module; exit 0
#RUN go get golang.org/x/mod/semver; exit 0
#RUN go get k8s.io/klog/v2; exit 0

ARG repo="${GOPATH}/src/github.com/biomedtech/oathkeeper-maester"

RUN mkdir -p $repo

WORKDIR $GOPATH/src/k8s.io/code-generator

VOLUME $repo