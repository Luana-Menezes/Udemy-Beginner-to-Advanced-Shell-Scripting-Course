#!/bin/bash
# Script 03-expansao-substrings
# Para fins didáticos do módulo e capítulo no Curso Extremamente Avançado de Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
red='\e[31;1m'
cian='\e[36;1m'
white='\e[37;1m'
off='\e[m'



#--------------------------------------------------------------------------------
_here_documents(){

	cat <<LimiteDaString
	
	Teste de echo sem echo, com here documents.
	
LimiteDaString
# essa linha precisa ficar no início da linha, caso contrário exibirá erro:
#  aviso: here-document na linha 16 delimitado pelo fim do arquivo (desejava `LimiteDaString')
#  erro de sintaxe: fim prematuro do arquivo
}

texto_em_var(){

variable=$(cat <<SETVAR
Essa variável
Roda em múltiplas linhas
SETVAR
	)

	echo "$variable"
}

here_function(){

	InfoDadosPessoais ()
	{
	  read firstname
	  read lastname
	  read address
	  read city 
	  read state 
	  read zipcode
	} # Isso certamente parece ser uma função interativa, mas. . .


	# Forneça a entrada para a função acima.
	InfoDadosPessoais <<RECORD001
	Marcos
	Oliveira
	999 , Rua X
	Londrina
	PR
	86080-855
RECORD001


	echo
	echo "$firstname $lastname"
	echo "$address"
	echo "$city, $state $zipcode"
	echo

	exit 0

}

comentarios_em_bloco(){

echo 'Essa linha sim será exibida.'

: <<COMMENTBLOCK
echo "Esta linha não será exibida".
Esta é uma linha de comentários que falta o prefixo "#".
Esta é outra linha de comentários que falta o prefixo "#".

&*@!++=
A linha acima não causará nenhuma mensagem de erro,
porque o intérprete Bash irá ignorá-lo.
COMMENTBLOCK

echo 'Essa linha também.'
echo 'Mas a linha do COMMENTBLOCK não! :)'

}

_here_strings(){

	if grep -q "$USER" <<< "$HOME" ; then
	   echo "$USER está em \"$HOME\""
	fi
}

# editor_de_texto_no_terminal
# Insira o comando: cat <<EOF > teste.txt
	
	# digite seu texto 

# para finalizar digite EOF e dê [enter]
# depois visualize com: cat teste.txt

# para trocar palavras imediatamente/automaticamente, use:

# cat <<EOF |  sed 's/palavrao/Piiiiii/g' >> teste.txt

# nesse caso eu usei >> , para aproveitar o arquivo teste.txt criado no exemplo anterior, sem sobreescrevê-lo.

# Redirecionamento avançados
#---------------------------
#
# ffprobe video.mp4 2>&1 | grep Duration # não consegue filtrar
# ffprobe video.mp4 2>&1 | grep Duration | grep start # filtra e start fica colorizado
# ffprobe video.mp4 2>&1 | grep Duration >&2 | grep start --color # filtra e Duration fica colorizado
# ffprobe video.mp4 2>&- | grep Duration # nada é exibido 0 '-' fechou a entrada padrão 1
# cat 3<>arquivo.txt # editor de texto no terminal , mas com saída duplicada do que você digitar.































