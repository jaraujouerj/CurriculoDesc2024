#!/bin/bash

# Verifica se o diretório "EmentarioAssinado" existe
if [ ! -d "EmentarioAssinado" ]; then
  echo "Erro: o diretório 'EmentarioAssinado' não foi encontrado."
  exit 1
fi

# Verifica se há arquivos PDF no diretório
shopt -s nullglob
pdfs=(EmentarioAssinado/*.pdf)
if [ ${#pdfs[@]} -eq 0 ]; then
  echo "Erro: nenhum arquivo PDF encontrado no diretório 'atas'."
  exit 1
fi

# Junta todos os PDFs usando pdftk
echo "Gerando ementario_completo.pdf com os arquivos de 'EmentarioAssinado/'..."
pdftk "${pdfs[@]}" cat output ementario_completo.pdf

# Verifica se o arquivo final foi criado com sucesso
if [ -f atas_completo.pdf ]; then
  echo "Arquivo 'ementario_completo.pdf' criado com sucesso!"
else
  echo "Erro ao criar o arquivo 'ementario_completo.pdf'."
  exit 1
fi
