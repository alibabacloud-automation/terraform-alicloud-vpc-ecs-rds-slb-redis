variable "name" {
  default = "terraform_test"
}

data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_vpc" "default" {
  count = length(data.alicloud_vpcs.default.ids) > 0 ? 0 : 1
  vpc_name   = var.name
  cidr_block = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 5, 11)
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_zones.default.zones.0.id
  vpc_id =  length(data.alicloud_vpcs.default.ids) > 0 ? "${data.alicloud_vpcs.default.ids.0}" : alicloud_vpc.default.0.id
}

resource "alicloud_vswitch" "default" {
  count = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 5, 11)
  vpc_id       = length(data.alicloud_vpcs.default.ids) > 0 ?  data.alicloud_vpcs.default.vpcs.0.id : alicloud_vpc.default.0.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

data "alicloud_security_groups" "default" {
  vpc_id = length(data.alicloud_vpcs.default.ids) > 0 ?  data.alicloud_vpcs.default.vpcs.0.id : alicloud_vpc.default.0.id
}

resource "alicloud_security_group" "default" {
  count = length(data.alicloud_security_groups.default.ids) > 0 ? 0 : 1
  name   = var.name
  vpc_id       = length(data.alicloud_vpcs.default.ids) > 0 ?  data.alicloud_vpcs.default.vpcs.0.id : alicloud_vpc.default.0.id
}


data "alicloud_zones" "default" {
  enable_details = true
  available_instance_type = "ecs.n4.large"
}

module "example" {
  source            = "../"
  name              = var.name
  availability_zone = data.alicloud_zones.default.zones.0.id
  vswitch_id         = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : alicloud_vswitch.default.0.id
  security_group_ids = [length(data.alicloud_security_groups.default.ids) > 0 ?  data.alicloud_security_groups.default.ids.0 : alicloud_security_group.default.0.id]

}
