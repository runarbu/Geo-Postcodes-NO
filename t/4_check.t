###############################################################################
#                                                                             #
#           Geo::Postcodes::NO Test Suite 4 - Available methods               #
#           ---------------------------------------------------               #
#               Arne Sommer - arne@cpan.org  - 23. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 4_check.t'.       #
#                                                                             #
###############################################################################

use Test::More tests => 22;

BEGIN { use_ok('Geo::Postcodes::NO') };

###############################################################################

my @methods  = qw(postcode location borough borough_number county type
                  type_verbose);

my @methods1 = Geo::Postcodes::NO::methods();
my @methods2 = Geo::Postcodes::NO->methods();

is_deeply(\@methods, \@methods1, "Geo::Postcodes::NO::methods()");
is_deeply(\@methods, \@methods2, "Geo::Postcodes::NO->methods()");

foreach (@methods)
{
  ok (Geo::Postcodes::NO::is_method($_), "Geo::Postcodes::NO::is_method()");
  ok (Geo::Postcodes::NO->is_method($_), "Geo::Postcodes::NO->is_method()");
}

foreach (qw (just kidding))
{
  ok (! Geo::Postcodes::NO::is_method($_), "Geo::Postcodes::NO::is_method()");
  ok (! Geo::Postcodes::NO->is_method($_), "Geo::Postcodes::NO->is_method()");
}

is (Geo::Postcodes::NO::selection("kidding", "1299"), undef);