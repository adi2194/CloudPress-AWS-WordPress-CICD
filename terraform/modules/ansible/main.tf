resource "local_file" "group_vars" {
  content = <<EOT
mysql_host: "${replace(var.rds_endpoint, ":3306", "")}"

db_admin_user: "${var.db_admin_user}"
db_admin_password: "${var.db_admin_password}"

wp_db_name: "${var.wp_db_name}"
wp_db_user: "${var.wp_db_user}"
wp_db_password: "${var.wp_db_password}"

wp_site_url: "http://${var.ec2_public_ip}"
wp_site_title: "${var.wp_site_title}"
wp_admin_user: "${var.wp_admin_user}"
wp_admin_password: "${var.wp_admin_password}"
wp_admin_email: "${var.wp_admin_email}"
EOT

  filename = "${var.ansible_dir}/group_vars/ec2.yml"
}

resource "null_resource" "inventory" {
  provisioner "local-exec" {
    command = <<EOT
echo "[ec2]" > ${var.ansible_dir}/hosts
echo "${var.ec2_public_ip} ansible_user=ec2-user ansible_private_key_file=${var.private_key_path}" >> ${var.ansible_dir}/hosts
EOT
  }
}
