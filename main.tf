resource "local_file" "pet" {
  filename = var.pet_filename
  content  = var.pet_content
}

resource "random_pet" "my_pet" {
  prefix   = var.random_pet_prefix
  separator = var.random_pet_separator
  length    = var.random_pet_length
}
