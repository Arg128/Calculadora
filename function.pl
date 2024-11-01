#!/usr/bin/perl
use strict;
use warnings;

# Imprime como tipo HTML
print "Content-type: text/html\n\n";
print "<html><head><title>Resultado</title></head><body>";

# Inicializa la ecuación directamente
my $ecuacion = "(2+2) (8*6)";

# Ahora se añade una expresión para encontrar todas las posibles operaciones
while ($ecuacion =~ /(\(\s*(\d+(\.\d+)?|\.\d+)\s*([\+\-\*\/])\s*(\d+(\.\d+)?|\.\d+)\s*\))/g) {
    my $expresion = $1; 
    my $num1 = $2;
    my $op = $4;
    my $num2 = $5;

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

    $ecuacion =~ s/\Q$expresion\E/$resultado/;
    print "<p> El resultado de $num1 $op $num2 es $resultado </p> $ecuacion";
    print "<p> Ecuación evaluada: $ecuacion </p>"
}

# Imprime el resultado final
print "<p> Ecuación evaluada: $ecuacion </p>";
print "</body></html>";

