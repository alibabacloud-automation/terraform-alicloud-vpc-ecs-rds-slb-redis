variable "redis_lazyfree-lazy-eviction" {
  description = "(Deprecated from version 1.1.0) The specification of the redis instance class. Use redis_lazyfree_lazy_eviction instead."
  type        = string
  default     = "redis.master.large.default"
}

#alicloud_vpc, alicloud_vswitch and alicloud_security_group
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = ""
}

variable "vpc_cidr_block" {
  description = "The specification of the vpc cidr block."
  type        = string
  default     = ""
}

variable "vswitch_cidr_block" {
  description = "The specification of the vswitch cidr block."
  type        = string
  default     = ""
}

variable "cidr_block" {
  description = "The cidr block of VPC"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The available zone to launch modules."
  type        = string
  default     = ""
}

#alicloud_slb_load_balancer
variable "slb_address_type" {
  description = "The specification of the slb intranet."
  type        = string
  default     = "intranet"
}

variable "slb_spec" {
  description = "The specification of the slb spec."
  type        = string
  default     = "slb.s2.small"
}

variable "vswitch_id" {
  description = "VSwitch variables, if vswitch_id is empty, then the net_type = classic."
  type        = string
  default     = ""
}

variable "slb_tags_info" {
  description = "The specification of the slb tags info."
  type        = string
  default     = ""
}

#alicloud_instance
variable "security_group_ids" {
  description = "A list of security group ids to associate with."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "The specification of the instance type."
  type        = string
  default     = ""
}

variable "system_disk_category" {
  description = "The specification of the system disk category."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_name" {
  description = "The specification of the system disk name."
  type        = string
  default     = ""
}

variable "system_disk_description" {
  description = "The specification of the system disk description."
  type        = string
  default     = ""
}

variable "image_id" {
  description = "The specification of the image id."
  type        = string
  default     = ""
}

variable "internet_max_bandwidth_out" {
  description = "The specification of the internet max bandwidth out."
  type        = number
  default     = 10
}

variable "data_disks_name" {
  description = "The name of the data disk."
  type        = string
  default     = ""
}

variable "ecs_size" {
  description = "The specification of the ecs size."
  type        = number
  default     = 1200
}

variable "category" {
  description = "The specification of the category."
  type        = string
  default     = "cloud_efficiency"
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = ""
}

variable "encrypted" {
  description = "Encrypted the data in this disk."
  type        = bool
  default     = false
}

#alicloud_db_instance
variable "engine" {
  description = "The specification of the engine."
  type        = string
  default     = "MySQL"
}

variable "engine_version" {
  description = "The specification of the engine version."
  type        = string
  default     = "5.6"
}

variable "rds_instance_type" {
  description = "The specification of the rds instance type."
  type        = string
  default     = ""
}

variable "instance_storage" {
  description = "The specification of the instance storage."
  type        = string
  default     = "30"
}

variable "instance_charge_type" {
  description = "The specification of the instance charge type."
  type        = string
  default     = "Postpaid"
}

variable "monitoring_period" {
  description = "The specification of the monitoring period."
  type        = string
  default     = "60"
}

#alicloud_kvstore_instance
variable "redis_instance_name" {
  description = "The specification of the redis instance name."
  type        = string
  default     = ""
}

variable "security_ips" {
  description = "The specification of the security ips."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "redis_instance_type" {
  description = "The specification of the redis instance type."
  type        = string
  default     = "Redis"
}

variable "redis_engine_version" {
  description = "The specification of the redis engine version."
  type        = string
  default     = "4.0"
}

variable "redis_instance_class" {
  description = "The specification of the redis instance class."
  type        = string
  default     = ""
}

variable "redis_appendonly" {
  description = "The specification of the redis instance class."
  type        = string
  default     = "redis.master.large.default"
}

variable "redis_lazyfree_lazy_eviction" {
  description = "The specification of the redis instance class."
  type        = string
  default     = "redis.master.large.default"
}