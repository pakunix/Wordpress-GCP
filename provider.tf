# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file("../turma03-infraagil-a-c6896fa2fa23.json")
  project     = var.pro_infra
  region      = var.region_c1
}
