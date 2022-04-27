#!/usr/bin/env bash
# Torne executável: $ chmod +x teste
uso() {
  cat <<EOF
uso: ${0##*/} [opções] [outro]

  Options:
    -f TAG      Exemplo de descrição do que a opção faz com complemento
    -L          Exemplo de descrição do que a opção faz sem complemento
    -h          Mostre essa mensagem
EOF
}

if [[ -z $1 || $1 = @(-h|--help) ]]; then
  uso
  exit $(( $# ? 0 : 1 ))
fi

echo -e "Essa é uma mensagem do comando teste!\n"
exit 0
