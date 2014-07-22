#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Mojolicious::Plugin::Neo4p' ) || print "Bail out!\n";
}

diag( "Testing Mojolicious::Plugin::Neo4p $Mojolicious::Plugin::Neo4p::VERSION, Perl $], $^X" );
