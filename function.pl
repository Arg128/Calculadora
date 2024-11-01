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
while ($expresion =~ /(?:\()(\d+(\.\d+)?|(\.\d+))\s*([\+\-\*\/])\s*(\d+(\.\d+)?|\.\d+)(?:\))/g/) {
  print <p1> El resultado es de $1 $3 $5 </p1>;
}

if ($expresion =~ /(?:\()(\d+|\.\d\d+)(?:\))/) {
  print <p1> El resultado es de $1 </p1>;
}

print end_html();
