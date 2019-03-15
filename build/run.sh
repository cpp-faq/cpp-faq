#!/bin/bash

docker build -f=Dockerfile -t=cpp-faq/cpp-faq .
docker run --rm -it cpp-faq/cpp-faq /bin/bash
