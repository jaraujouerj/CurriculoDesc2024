#!/bin/bash

# Verifica se o diretório "atas" existe
if [ ! -d "atas" ]; then
  echo "Erro: o diretório 'atas' não foi encontrado."
  exit 1
fi

# Verifica se há arquivos PDF no diretório
shopt -s nullglob
pdfs=(atas/*.pdf)
if [ ${#pdfs[@]} -eq 0 ]; then
  echo "Erro: nenhum arquivo PDF encontrado no diretório 'atas'."
  exit 1
fi

# Junta todos os PDFs usando pdftk
echo "Gerando atas_completo.pdf com os arquivos de 'atas/'..."
pdftk "${pdfs[@]}" cat output atas_completo.pdf

# Verifica se o arquivo final foi criado com sucesso
if [ -f atas_completo.pdf ]; then
  echo "Arquivo 'atas_completo.pdf' criado com sucesso!"
else
  echo "Erro ao criar o arquivo 'atas_completo.pdf'."
  exit 1
fi
