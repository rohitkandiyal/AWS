## VPC CF Points

* To deploy:

```aws cloudformation deploy --template-file vpc.yaml --stack-name kong-demo-vpc```

Then assign the route in private route table for NAT gw. Not done via CF as it fails.

* To delete:

First Delete NAT GW route from private RT and then:

```aws cloudformation delete-stack --stack-name kong-demo-vpc```

## EC2 CF Points

To create:

```aws cloudformation deploy --template-file 2-ec2.yaml --stack-name kong-demo-ec2```

