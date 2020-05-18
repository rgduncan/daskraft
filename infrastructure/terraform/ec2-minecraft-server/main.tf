terraform {
  backend s3 {
    bucket = "rgduncan-terraform-state"
    key = "infrastructure/daskraft/ec2-mc.tfstate"
    region = "us-west-2"
    profile = "personal"
  }
}

provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "personal"
}

module "minecraft" {
  source = "git@github.com:darrelldavis/terraform-aws-minecraft.git?ref=master"

  bucket_name = "daskraft-dev-r41heqls7z4p"

  // VPC
  vpc_id = "vpc-0dcafbb740907b5b4"
  subnet_id = "subnet-09d13332dc061eaab"

  // Tags
  name = "minecraft-1"
  namespace = "games"
  environment = "prod"
  tags = {}

  // App settings - Minecraft
  mc_port = 25565
  mc_root = "/home/minecraft"
  mc_version = "1.15.2"
  mc_backup_freq = 5

  // JVM settings
  java_ms_mem = "1G"
  java_mx_mem = "1G"

  // Instance vars
  associate_public_ip_address = true
  instance_type = "t3.small"
//  ami = ""
//  allowed_cidrs = "0.0.0.0/32"
}