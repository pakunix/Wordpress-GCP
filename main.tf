# Cria uma VM no Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "helloworld2"
  machine_type = "f1-micro"
  zone         = var.zone_c1a

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = var.lnx_bnt
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default"
    access_config {
    }
  }
  #Conexão SSH para validar Conectividade
  provisioner "remote-exec" {
    inline = ["echo 'Liberado para o Ansible'"]

    connection {
      type        = "ssh"
      user        = "paulo_kinos"
      private_key = file("id_rsa")
      host        = google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip
      timeout     = "90s"
    }
  }
  # Cria o inventário do Ansible
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip} > ansible/inventory"
  }

# Executa a playbook na máquina provisionada
# provisioner "local-exec" {
# command = "ansible-playbook -i ansible/inventory --private-key id_rsa ansible/playbook.yml"
# }

}
## Cria SQL Gerenciado com Engine MySQL
#resource "google_sql_database_instance" "helloworld" {
#  name             = "database"
#  database_version = var.sgbd
#  region           = var.zone_c1
#  settings {
#    tier = "db-f1-micro"
#  }
#}
