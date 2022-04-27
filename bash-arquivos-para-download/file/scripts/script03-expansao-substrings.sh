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
expansao_condicional(){

	clear && echo
	
	param=$1	
	echo ${param:-palavra} # Se 'param' não está definido, retorne 'palavra'
	#${param:=palavra} # Se 'param' não está definido, defina-o com 'palavra'
	#${param:?palavra} # Se 'param' não está definido, retorne como erro: 'palavra'
	#${param:+palavra} # Se 'param' está definido, retorne 'palavra', senão retorne o vazio
	
# caso deseje usar essa tabela no terminal, descomente esse código (echo|cat|sed '27,41!d' $0)
:<<EXPANSAO_CONDICIONAL

|--------------------------------------------------------------------------------------------------------------------------------------------------|
|Índice | Sintaxe           | Descrição                                                 | Visão1                | Visão2                           |
|-------|-------------------|-----------------------------------------------------------|-----------------------|----------------------------------|
|1      | ${param:-palavra} | Se'param'nãoestádefinido,retorne'palavra'                 | echo${param:-palavra} | param="ok";echo${param:-palavra} |
|-------|-------------------|-----------------------------------------------------------|-----------------------|----------------------------------|
|2      | ${param:=palavra} | Se'param'nãoestádefinido,defina-ocom'palavra'             | echo${param:=palavra} | param="ok";echo${param:=palavra} |
|-------|-------------------|-----------------------------------------------------------|-----------------------|----------------------------------|
|3      | ${param:?palavra} | Se'param'nãoestádefinido,retornecomoerro:'palavra'        | ${param:?palavra}     | param="ok";${param:?palavra}     |
|-------|-------------------|-----------------------------------------------------------|-----------------------|----------------------------------|
|4      | ${param:+palavra} | Se'param'estádefinido,retorne'palavra',senãoretorneovazio | echo${param:+palavra} | param=ok;echo${param:+palavra}   |
|--------------------------------------------------------------------------------------------------------------------------------------------------|
* Para tabela completa com emulação dos comandos e outro modo consulte a tabela completa no vídeo ou diretórios images.
* Criada por Marcos Oliveira

EXPANSAO_CONDICIONAL
	
}
# DESCOMENTE A LINHA LOGO ABAIXO PARA VER A SAÍDA DA FUNÇÃO
#expansao_condicional "$@" # aqui criar $1 $2 $3 ... Já essa $* cria tudo como $1
# ./script03-expansao-substrings.sh Está definida --> $1=Está
# ./script03-expansao-substrings.sh "Está definida" --> $1=Está definida
#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
expansao_substrings(){

	clear && echo

	echo ${1:5}
	#      ^ nº do parâmetro=$1
	# Se você passar o parâmetro: 123abc , a saída será: 'c'
	# É o mesmo comando da tabela logo abaixo do vídeo de nome: Mais exemplos
	# A diferença é que lá usamos o comando set para definir a variável $1 usando '--', para poder ser lida pelo echo
	# pois se definirmos 1 pelo terminal, assim: 1="123abc" , dará erro, pois o bash interpreta ele como comando, por isso é uma variável especial.
	# Para mais informações sobre '--' , rode o comando: set --help | grep '\-\-'
	# A saída será em inglês, mas dirá que atribui o valor para o parâmetro de posição, no caso o 1
	
	param='terminalroot'
	echo ${param%root} # Saída: terminal
	# sed 's/root$//' 	Corta 'param' do final da word (o '%%' é usado para extender ainda mais)
	
	param='terminalroot'
	echo -e ${param%%root} # Saída: terminal
	# sed 's/root$//g' 	Corta 'param' do final da word (o '%%' é usado para extender ainda mais) (extender ainda mais = todas ocorrẽncias QUE ESTÂO NO FINAL , seria o /g do sed)

}
# DESCOMENTE A LINHA LOGO ABAIXO PARA VER A SAÍDA DA FUNÇÃO
expansao_substrings "$@"
#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
	#shopt -u extglob 
	#ls arq+(1|4)
	## bash: erro de sintaxe próximo ao token inesperado `('
#--------------------------------------------------------------------------------



