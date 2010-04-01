
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::Plugin::LatestPrereqs',
                       'DISTNAME' => 'Dist-Zilla-Plugin-LatestPrereqs',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Pedro Melo <melo@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Test::More' => '0.92'
                                           },
                       'ABSTRACT' => 'adjust prereqs to use latest version available',
                       'EXE_FILES' => [],
                       'VERSION' => '0.2',
                       'PREREQ_PM' => {
                                        'Dist::Zilla' => '2.0',
                                        'CPAN' => '1.9402'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



