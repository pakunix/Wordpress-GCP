# Cria uma VM no Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "helloworld2"
  machine_type = "f1-micro"
  zone         = "var.zone_c1a"

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "var.lnx_bnt"
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default"
    access_config {
    }
  }
}
# Cria SQL Gerenciado com Engine MySQL
resource "google_sql_database_instance" "helloworld" {
  name             = "database"
  database_version = "var.sgbd"
  region           = "var.zone_c1"
  settings {
    tier = "db-f1-micro"
  }
}
