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
if ($expresion =~ /(?:\()(\d+|\.\d\d+)(?:\))/) {
  print <p1> El resultado es de $1 </p1>;
}

print end_html();
