provider "null" {}

resource "null_resource" "create_directory_and_file" {
  connection {
    type        = "ssh"
    host        = "servidores-linux.70-71-bc-12-b3-87@cloud.shellhub.io"
    user        = "jaime"
    private_key = var.ssh_private_key  # Usando a chave privada do GitHub Secrets
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/jaime/novo_diretorio_terraform",
      "echo 'Este é o conteúdo do arquivo' > /home/jaime/novo_diretorio_terraform/arquivo.txt"
    ]
  }
}

# Variáveis
variable "ssh_private_key" {
  type = string
}