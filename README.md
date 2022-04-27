
# Some anotations

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

| Numerical Comparison |Numeric Comparison |
|-----------------------|-----------------------|
| -lt | Is less than (LessThan) |
| -gt | Is greater than (GreaterThan) |
| -le | LessEqual (LessEqual) |
| -ge | GreaterEqual |
| -eq | Equals (EQual) |
| -ne | Is Different (NotEqual) |
| String Comparison |
| = | is equal |
| != | It's different |
| -n | Is not null |
| -z | Is null |
| Logical Operators |
| ! | logical NOT (NOT) |
| -a | And logical (AND) |
| it | Logical OR (OR) |
| Tests in files |
| -b | It is a block device |
| -c | It's a character device |
| -d | Is a directory |
| -e | File exists |
| -f | It's a regular file |
| -g | SGID bit is on |
| -G | The file's group is that of the current user |
| -k | Sticky-bit is on |
| -L | The file is a symbolic link |
| -O | The file owner is the current user |
| -p | The file is a named pipe |
| -r | File has read permission |
| -s | File size is greater than zero |
| -S | The file is a socket |
| -t | The file descriptor N is a terminal |
| -u | SUID bit is on |
| -w | File is writable |
| -x | File has execute permission |
| -nt | The file is newer (NewerThan) |
| -ot | The file is older (OlderThan) |
| -ef | The file is the same (EqualFile) |

### IF ELSE

Unlike other languages, 'if' tests a command and not a condition. But the 'test' command tests conditions, so just use it in conjunction with if.

### LOOPS

- CONTINUE, BREAK, EXIT

### I/O

### Math in Shell Scripts

### How to create graphical and interactive programs with Shell Script

- Dialog
- Yad
- Xdialog
- Kdialog
- Whiptail
- Udpm
- PythonDialog
- Gdialog

### How to create websites with Shell Script, Bootstrap e HTML5



