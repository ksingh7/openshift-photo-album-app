FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev curl vim

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 8080

#ENV ENDPOINT_URL "https://s3-openshift-storage.apps.ocp42.ceph-s3.com"
#ENV AWS_ACCESS_KEY_ID "ewXH8ErFOXMlfxqqXWoD"
#ENV AWS_SECRET_ACCESS_KEY "2yMWDOTSvYB0BdAJnYW096cR3hmbnCVeyIhQBqfO"
#ENV BUCKET "obc-test-noobaa-99ad4f8f-8509-4eb2-b73d-ba6a404ada08"

ENV BUCKET_NAME "$BUCKET_NAME"
ENV ENDPOINT_URL "$ENDPOINT_URL"
ENV AWS_ACCESS_KEY_ID "$AWS_ACCESS_KEY_ID"
ENV AWS_SECRET_ACCESS_KEY "$AWS_SECRET_ACCESS_KEY"


ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

