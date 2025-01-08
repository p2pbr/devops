provider "null" {}

resource "null_resource" "create_directory_and_file" {
  connection {
    type        = "ssh"
    host        = "cloud.shellhub.io"
    user        = "jaime"
    private_key = var.ssh_private_key  # Chave privada passada como variável
    port        = 22                   # Garantindo que a porta SSH padrão seja usada
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

# Output para verificar o caminho da chave
output "ssh_private_key" {
  value = var.ssh_private_key
}
