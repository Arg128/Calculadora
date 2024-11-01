#!/usr/bin/perl
use strict;
use warnings;

# Imprime como tipo HTML
print "Content-type: text/html\n\n";
print "<html><head><title>Resultado</title></head><body>";

my $ecuacion = "(((5 * 5) * (6 * (8 + (7 / 1)))) + (( 6 * 5) - 29))";

# Evaluar todas las operaciones dentro de los paréntesis
while ($ecuacion =~ /\(([^()]+)\)/g) {
    my $expresion = $1;  # La expresión interna
    # Busca los números y el operador
    if ($expresion =~ /(\d+(\.\d+)?|\.\d+)\s*([\+\-\*\/])\s*(\d+(\.\d+)?|\.\d+)/) {
        my $num1 = $1;       # Primer número
        my $op = $3;         # Operador
        my $num2 = $4;       # Segundo número

        # Detecta y manipula la expresión
        my $resultado;
        if ($op eq '+') {
            $resultado = $num1 + $num2;
        } elsif ($op eq '-') {
            $resultado = $num1 - $num2;
        } elsif ($op eq '*') {
            $resultado = $num1 * $num2;
        } elsif ($op eq '/') {
            $resultado = $num1 / $num2;
        }

        # Reemplaza en la cadena original
        ##Expresion  servible
        $ecuacion =~ s/\(\s*\Q$expresion\E\s*\)/$resultado/;
        ##Expresion no servible
        ##$ecuacion =~ s/\Q$expresion\E/$resultado/;
        # Imprime el resultado
        print "<p> El resultado de ($expresion) es $resultado </p>";
        print "<p> Ecuación evaluada: $ecuacion </p>";
    }
}

print "<p> Ecuación final evaluada: $ecuacion </p>";
print "</body></html>";
