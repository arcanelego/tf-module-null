resource "stateful_map" "my_resource" {
  // The "count" meta-parameter is used to address destroy provisioner limitation
  // See https://www.terraform.io/docs/provisioners/index.html#destroy-time-provisioners for details
  // For the sake for usage example we read value from file, in real world set it explicitely
  # count = trimspace(file("count"))

  desired = {
    foo = "barbas1"
    bar = "barbas"
    baz = "barbas"
    bro = "barbas1"
  }

}


resource "null_resource" "test" {
  # id = "aksjdasd"
  # triggers = {
  #   cluster_instance_ids = null_resource.test3.id
  # }

}


resource "null_resource" "test2" {
  for_each = toset(["asdasdas", "asdfvdsfgsd", "fsdfgklj"])

}

resource "null_resource" "test3333" {

}


resource "null_resource" "test4" {

  triggers = {
    cluster_instance_ids = null_resource.test.id
  }

}

# resource "null_resource" "test5" {
#       provisioner "local-exec" {
#     command = "sleep 15"
#   }
# }


# resource "null_resource" "test25" {
#     #  depends_on = [null_resource.test31]   
#   provisioner "local-exec" {
#     command = "sleep 20"
#   }
# }

resource "null_resource" "test31" {


  provisioner "local-exec" {
    command = "sleep 10"
  }
  depends_on = [null_resource.test4]
}


resource "null_resource" "test41" {

  depends_on = [null_resource.test31]
}

resource "null_resource" "test51" {

  depends_on = [null_resource.test31]
}


resource "null_resource" "test251" {

}


