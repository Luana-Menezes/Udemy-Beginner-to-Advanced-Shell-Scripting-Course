
## Variables and Arrays

### Enviroment variables

```bash
    printenv
```

```bash
    env
```

### Set and Unset variables in local/session shell

```bash
    TESTE="nada"
```

```bash
    echo $TESTE
```

```bash
    unset TESTE
```

```bash
    echo $TESTE
```

### Exporting variables to enviroment variables

```bash
    HELLO="Hello, world!"
```

```bash
    export HELLO
```

```bash
    env | grep HELLO
```

```bash
    printenv | grep HELLO
```

### Special variables

| Variable | Positional Parameters |
|----------|------------------------------|
| $0 | Parameter number 0 (command or function name) |
| $1 | Parameter number 1 (from command line or function) |
| ... | Parameter number N ... |
| $9 | Parameter number 9 (from command line or function) |
| ${10} | Parameter number 10 (from command line or function) |
| ... | Parameter number NN ... |
| $# | Total number of command line or function parameters |
| $* | All parameters as a single string |
| $@ | All parameters such as multiple protected strings |
| Variable | Miscellaneous |
| $$ | PID number of the current process (from the script itself) |
| $! | PID number of the last background job |
| $_ | Last argument of the last command executed |
| $? | Return code from the last command executed |


### Variable expansion

Command substitution allows the output of a command to replace the command itself. Command substitution occurs when a command is enclosed like this:

```bash
    $(command)
```
or

```bash
    ${command}
```

| Syntax | Conditional Expansion |
|--------------------|----------------------------------|
| ${var:-text} | If var is not defined, return 'text' |
| ${var:=text} | If var is not set, set it to 'text' |
| ${var:?text} | If var is not defined, returns error 'text' |
| ${var:+text} | If var is defined, it returns 'text', otherwise it returns empty |
| Syntax | String Expansion |
| ${var} | Same as $var, but unambiguous |
| ${#var} | Returns the length of the string |
| ${!var} | Execute the contents of $var (equals 'eval \$$var') |
| ${!text*} | Returns variable names starting with 'text' |
| ${var:N} | Returns text from position 'N' |
| ${var:N:tam} | Returns 'tam' characters from position 'N' |
| ${var#text} | Cut 'text' from beginning of string |
| ${var##text} | Cut 'text' from beginning of string (*greedy) |
| ${var%text} | Cut 'text' from end of string |
| ${var%%text} | Cut 'text' from end of string (*greedy) |
| ${var/text/new} | Replace 'text' with 'new', once |
| ${var//text/new} | Replace 'text' with 'new', always |
| ${var/#text/new} | If string starts with 'text', replace 'text' with 'new' |
| ${var/%text/new} | If string ends with 'text', replace 'text' with 'new' |
| ${var^} | Convert the first character to uppercase |
| ${var^^} | Convert all characters to uppercase |
| ${var,} | Convert the first character to lowercase |
| ${var,,} | Convert all characters to lowercase |
| ${var~} | Invert case of first character |
| ${var~~} | Inverts all characters |


## Functions

### Variables in functions

If you create a variable inside a function, even calling it outside the function, the value of the variable will be displayed, as it will be treated as a global variable. In order for the value of a variable to be displayed only within the function, we need to use the 'local' command in the variable declaration.

### Constant Variable

```bash
    declare -r myConstant="This is a constant"
```

### External files

It works like include, import from another languages

```bash
    source external_file.sh
```

## Conditions

### Test

```bash
    test 1 = 1; echo $?
```
or

```bash
    [ 1=1 ]; echo $?
```

| Comparação Numérica   |Comparação Numérica |
|-----------------------|-----------------------|
| -lt                   | É menor que (LessThan)                  |
| -gt                   | É maior que (GreaterThan)               |
| -le                   | É menor igual (LessEqual)               |
| -ge                   | É maior igual (GreaterEqual)            |
| -eq                   | É igual (EQual)                         |
| -ne                   | É diferente (NotEqual)                  |
| Comparação de Strings |
| =                     | É igual                                 |
| !=                    | É diferente                             |
| -n                    | É não nula                              |
| -z                    | É nula                                  |
| Operadores Lógicos    |
| !                     | NÃO lógico (NOT)                        |
| -a                    | E lógico (AND)                          |
| -o                    | OU lógico (OR)                          |
| Testes em arquivos    |
| -b                    | É um dispositivo de bloco               |
| -c                    | É um dispositivo de caractere           |
| -d                    | É um diretório                          |
| -e                    | O arquivo existe                        |
| -f                    | É um arquivo normal                     |
| -g                    | O bit SGID está ativado                 |
| -G                    | O grupo do arquivo é o do usuário atual |
| -k                    | O sticky-bit está ativado               |
| -L                    | O arquivo é um link simbólico           |
| -O                    | O dono do arquivo é o usuário atual     |
| -p                    | O arquivo é um named pipe               |
| -r                    | O arquivo tem permissão de leitura      |
| -s                    | O tamanho do arquivo é maior que zero   |
| -S                    | O arquivo é um socket                   |
| -t                    | O descritor de arquivos N é um terminal |
| -u                    | O bit SUID está ativado                 |
| -w                    | O arquivo tem permissão de escrita      |
| -x                    | O arquivo tem permissão de execução     |
| -nt                   | O arquivo é mais recente (NewerThan)    |
| -ot                   | O arquivo é mais antigo (OlderThan)     |
| -ef                   | O arquivo é o mesmo (EqualFile)         |

### IF

Unlike other languages, 'if' tests a command and not a condition. But the test command tests conditions, so just use it in conjunction with if.

