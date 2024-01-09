module "network" {
  source = "./network"
  vpc_id = module.network.vpc_id
}

module "security" {
  source = "./security"
  vpc_id = module.network.vpc_id
}

module "vms" {
  source            = "./vms"
  vpc_id            = module.network.vpc_id
  security_group_id = module.security.security_group_id
  public_subnet_id  = module.network.public_subnet_id
}
