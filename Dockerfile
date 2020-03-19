FROM amazonlinux:2

WORKDIR /usr/local/bin
RUN yum install unzip -y
ADD https://releases.hashicorp.com/consul-aws/0.1.1/consul-aws_0.1.1_linux_amd64.zip .
RUN unzip consul-aws_0.1.1_linux_amd64.zip

ENTRYPOINT ["consul-aws", "sync-catalog", "-datacenter=dc1", "-http-addr=http://18.235.1.76:8500", "-aws-namespace-id", "ns-fjmsnikh7zrvm3ie", "-to-consul", "-to-aws"]
