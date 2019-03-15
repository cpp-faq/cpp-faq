FROM golang:1.11

LABEL maintainer="C++ FAQ <https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR>"
LABEL version "1.0"

#USER ROOT

ENV BUILD_FOLDER="/opt/cpp-faq/build/"
ENV ROOT_FOLDER="/opt/cpp-faq/src/"
ENV BASE_URL="https://github.com/cpp-faq/cpp-faq"

# Build faqbuilder
WORKDIR $GOPATH/
ENV GOPATH="/go/faq-builder/"

RUN git clone https://github.com/cpp-faq/faq-builder.git #&& ls -l faq-builder && go install faqbuilder

RUN mkdir -p /opt/cpp-faq/build
#COPY ../src /opt/cpp-faq/src

# Build the FAQ
#CMD cd /go/faq-builder/bin/ && chmod +x faqbuilder && ./faqbuilder -verbose --exit-on-error=false -root-folder=$ROOT_FOLDER -build-folder=BUILD_FOLDER -base-url="https://github.com/cpp-faq/cpp-faq"
