# EKS Getting Started Guide Configuration

This is the full configuration from https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html

See that guide for additional information.

NOTE: This full configuration utilizes the [Terraform http provider](https://www.terraform.io/docs/providers/http/index.html) to call out to icanhazip.com to determine your local workstation external IP for easily configuring EC2 Security Group access to the Kubernetes master servers. Feel free to replace this as necessary.

## Providing k8s access to other AWS users after creation
SOURCE: https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/

To quickly add a new user simply use:
```
kubectl edit configmap -n kube-system aws-auth
```

And add the designated user (using his `ARN` and `username`) to a map like so:
```
apiVersion: v1 
kind: ConfigMap 
metadata: 
  name: aws-auth 
  namespace: kube-system 
data: 
  mapRoles: | 
    - rolearn: arn:aws:iam::11122223333:role/EKS-Worker-NodeInstanceRole-1I00GBC9U4U7B 
      username: system:node:{{EC2PrivateDNSName}} 
      groups: 
        - system:bootstrappers 
        - system:nodes 
  mapUsers: | 
    - userarn: arn:aws:iam::11122223333:user/designated_user 
      username: designated_user 
      groups: 
        - system:masters
```
