use 5.012;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Mojolicious::Plugin::Neo4p',
    AUTHOR           => q{J.E. Turcotte <joshua.eric.turcotte@gmail.com>},
    VERSION_FROM     => 'lib/Mojolicious/Plugin/Neo4p.pm',
    ABSTRACT_FROM    => 'lib/Mojolicious/Plugin/Neo4p.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.012,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Mojolicious' => 5.0,
        'REST::Neo4p' => 0.120
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Mojolicious-Plugin-Neo4p-*' },
);
