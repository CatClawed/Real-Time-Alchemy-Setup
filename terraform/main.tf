/*

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

*/

module "obs" {
  source        = "./modules/ec2"
  machine_use   = "OBS"
  instance_type = "g4dn.xlarge"
  name          = "obs-ubuntu"

  providers = {
    aws = aws.california
  }
}

output "obs-ip" {
  value = module.obs.ec2_ip
}
