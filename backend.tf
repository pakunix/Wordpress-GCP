terraform {
  backend "gcs" {
    bucket = "turma03-infraagil-a"
    credentials = "turma03-infraagil-a-c6896fa2fa23.json"
  }
}
