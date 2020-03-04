FROM mhart/alpine-node:6

RUN apk update
RUN apk add bash
RUN apk add git
RUN mkdir /code && \
    cd /code && \
    git clone https://github.com/datagraft/Datagraft-RDF-to-Arango-DB.git && \
    cd Datagraft-RDF-to-Arango-DB && \
    npm install


COPY run.sh move_to_output.sh  to_arangodb.sh /

WORKDIR /