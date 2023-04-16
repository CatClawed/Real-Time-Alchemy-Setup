module "rtmp-california" {
  source = "./modules/ec2"

  providers = {
    aws = aws.california
  }
}

module "rtmp-tokyo" {
  source = "./modules/ec2"

  providers = {
    aws = aws.tokyo
  }
}

output "rtmp-california-ip" {
  value = module.rtmp-california.ec2_ip
}

output "rtmp-tokyo-ip" {
  value = module.rtmp-tokyo.ec2_ip
}
