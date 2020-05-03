module "minecraft" {
  source = "git@github.com:darrelldavis/terraform-aws-minecraft.git?ref=master"

  // VPC
  vpc_id = "vpc-02513a5bde7515caa"
  subnet_id = "subnet-021599521e089b04b"

  // Tags
  name = "minecraft-1"
  namespace = "games"
  environment = "prod"
  tags = {}

  // App settings - Minecraft
  mc_port = 25565
  mc_root = "/home/minecraft"
  mc_version = "latest"
  mc_backup_freq = 5

  // JVM settings
  java_ms_mem = "1G"
  java_mx_mem = "1G"

  // Instance vars
  // https://aws.amazon.com/ec2/pricing/on-demand/
  // https://aws.amazon.com/ec2/instance-types/
  associate_public_ip_address = true
//  ami = ""
  instance_type = "t3a.small"
  allowed_cidrs = ""
}