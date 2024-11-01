#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);

#Se usa de CGI


my $query = new --> CGI();
my $expresion = $query --> param('ecuacion');

##imprime como tipo html
print header(text/html);
##Titulo
print start_html('Resultado');

##Ahora se esta añadiendo una expreción, con ayuda de bucle para encontrar todas las posibles 
##operaciónes, y detectar su formato de cambio [\+\-\*\/]

##                            $1                  $2      $3      $4      $5
##Este \s separa a $2 y a $4, ya que estos contienen espaciós, pero con \s este modifica y quita
##Dejando así una expresión solo con los numeros...
my $ecuacion = "( 2 * 2 )";
while ($ecuacion =~ /(\()(\d+(\.\d+)?|\.\d+)\s*([\+\-\*\/])\s*(\d+(\.\d+)?|\.\d+)(\))/g) {
    my $paren_abierto = $1;
    my $num1 = $2;
    my $op = $4;
    my $num2 = $5;
    my $paren_cerrado = $7;

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
    $ecuacion =~ s/\Q$paren_abierto$num1\s*$op\s*$num2$paren_cerrado\E/($resultado)/;
    print "<p> El resultado de $num1 $op $num2 es $resultado </p>";
    print $ecuacion;
}

print end_html();
