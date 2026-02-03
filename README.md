bastion host ka abi use nahi kiya
sabse phele APP vpc banaya.
private ec2(jo private subnet m hai) ke andar user script chlyi.
nat gateway banaya.
ec2 security groups:
	
HTTP (80), HTTPS (443), Custom TCP (8080), and SSH (22) — all allowed from 0.0.0.0/0 (IPv4).

Alb sg 
HTTP (80), HTTPS (443), Custom TCP (8080), — all allowed from 0.0.0.0/0 (IPv4)

ssm bhi bnoa :
iske liye do iam role add karo 
AmazonSSMManagedEC2InstanceDefaultPolicy
AmazonSSMManagedInstanceCore

target group add kro:
health checks:
Protocol
HTTP
Path
/
Port
Traffic port
Healthy threshold
5 consecutive health check successes
Unhealthy threshold
2 consecutive health check failures
Timeout
5 seconds
Interval
30 seconds
Success codes
200



alb mai listner port 80
good to go alb ka dna hit kro kuch aise
alb_dns/devops_proj1/myapp/index.html
