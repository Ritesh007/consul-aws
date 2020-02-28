FROM amazonlinux:2

# aws namespaceid that sync's with consul
ARG aws_namespace_id="ns-fjmsnikh7zrvm3ie"

# consul datacenter to sync with aws
ARG data_center="dc1"

# consul DNS
ARG consul_dns="http://3.92.18.101:8500"

WORKDIR /usr/local/bin
RUN yum install unzip -y
ADD https://releases.hashicorp.com/consul-aws/0.1.1/consul-aws_0.1.1_linux_amd64.zip .
RUN unzip consul-aws_0.1.1_linux_amd64.zip

ENTRYPOINT ["consul-aws", "sync-catalog", "-datacenter=$data_center", "-http-addr=$consul_dns", "-aws-namespace-id", "$aws_namespace_id", "-to-consul", "-to-aws"]
