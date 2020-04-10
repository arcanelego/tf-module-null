resource "null_resource" "module_resource" {
  triggers = {
    cluster_instance_ids = var.null_name
  }
}

output "null_resource" {
    value = null_resource.module_resource.id
}

resource "null_resource" "module_resource2" {
  triggers = {
    cluster_instance_ids = var.null_name
  }
}

resource "stateful_map" "aaaaa" {
  // The "count" meta-parameter is used to address destroy provisioner limitation
  // See https://www.terraform.io/docs/provisioners/index.html#destroy-time-provisioners for details
  // For the sake for usage example we read value from file, in real world set it explicitely
  # count = trimspace(file("count"))

  desired = {
    foo = "barbas"
    bar = "barbas"
    baz = "barbas"
  #   bro = jsonencode({
  #     blah="blah",
  #         cluster_instance_ids=var.null_name,
  # triggers = {
  #   cluster_instance_ids = var.null_name
  # }
    

  }
  real = {
    foo = "bar"
    bar = "bar"
    baz = "bar"
    bro = "bar"
  }

}