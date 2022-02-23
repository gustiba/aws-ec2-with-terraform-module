output "public_dns" {
  description = "list of instance  public dns"
  value = [aws_instance.this.*.public_dns]
}

output "public_ip" {
  description = "ip public"
  value = [aws_instance.this.*.public_ip]
}

output "az_instance_location" {
  value = [aws_instance.this.*.availability_zone]
}