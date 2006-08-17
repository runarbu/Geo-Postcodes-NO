###############################################################################
#                                                                             #
#          Geo::Postcodes::NO Test Suite 1 - Procedural interface             #
#          ------------------------------------------------------             # 
#               Arne Sommer - perl@bbop.org  - 19. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 1_procedures.t'.  #
#                                                                             #
###############################################################################

use Test::More tests => 52;

BEGIN { use_ok('Geo::Postcodes::NO') };

#################################################################################

ok(   Geo::Postcodes::NO::legal ("0010"), "Lovlig postnummer");
ok(   Geo::Postcodes::NO::valid ("0010"), "Postnummer i bruk");
ok(   Geo::Postcodes::NO::legal ("1178"), "Lovlig postnummer");
ok(   Geo::Postcodes::NO::valid ("1178"), "Postnummer i bruk");
ok(   Geo::Postcodes::NO::legal ("2542"), "Lovlig postnummer");
ok(   Geo::Postcodes::NO::valid ("2542"), "Postnummer i bruk");

ok(   Geo::Postcodes::NO::legal ("0000"), "Lovlig postnummer");
ok( ! Geo::Postcodes::NO::valid ("0000"), "Postnummer ikke i bruk");
ok(   Geo::Postcodes::NO::legal ("9999"), "Lovlig postnummer");
ok( ! Geo::Postcodes::NO::valid ("9999"), "Ulovlig postnummer");

ok( ! Geo::Postcodes::NO::legal ("10"),              "Ulovlig postnummer");
ok( ! Geo::Postcodes::NO::valid ("10"),              "Ulovlig postnummer");
ok( ! Geo::Postcodes::NO::legal ("Ett eller annet"), "Ulovlig postnummer");
ok( ! Geo::Postcodes::NO::valid ("Ett eller annet"), "Ulovlig postnummer");

#################################################################################

my $postcode = "1178"; # My postal code.

is( Geo::Postcodes::NO::location_of      ($postcode), "OSLO", "Postnummer > Poststed");
is( Geo::Postcodes::NO::borough_number_of($postcode), "0301", "Postnummer > Kommunenummer");
is( Geo::Postcodes::NO::borough_of       ($postcode), "OSLO", "Postnummer > Kommune");
is( Geo::Postcodes::NO::county_of        ($postcode), "OSLO", "Postnummer > Fylke");
is( Geo::Postcodes::NO::kommunenr2fylke  (Geo::Postcodes::NO::borough_number_of($postcode)), "OSLO", "Kommunenummer > Fylke");
is( Geo::Postcodes::NO::type_of          ($postcode), "ST",             "Postnummer > Kategori");
is( Geo::Postcodes::NO::type_verbose_of  ($postcode), "Gateadresse",    "Postnummer > Kategori");
is( Geo::Postcodes::type_verbose_of      ($postcode), undef,            "Postnummer > Kategori");

## Try another one, where the names differ. #####################################

$postcode = "2542"; # Another one.

is( Geo::Postcodes::NO::location_of      ($postcode), "VINGELEN", "Postnummer > Poststed");
is( Geo::Postcodes::NO::borough_number_of($postcode), "0436",     "Postnummer > Kommunenummer");
is( Geo::Postcodes::NO::borough_of       ($postcode), "TOLGA",    "Postnummer > Kommune");
is( Geo::Postcodes::NO::county_of        ($postcode), "HEDMARK",  "Postnummer > Fylke");
is( Geo::Postcodes::NO::kommunenr2fylke  (Geo::Postcodes::NO::borough_number_of($postcode)), "HEDMARK", "Kommunenummer > Fylke");
is( Geo::Postcodes::NO::type_of          ($postcode), "ST",           "Postnummer > Kategori");
is( Geo::Postcodes::NO::type_verbose_of  ($postcode), "Gateadresse", "Postnummer > Kategori");
is( Geo::Postcodes::type_verbose_of      ($postcode), undef,          "Postnummer > Kategori");

## And now, error handling ######################################################

is( Geo::Postcodes::NO::location_of ("9999"),            undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::location_of (undef),             undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::location_of ("Ett eller annet"), undef, "Undef ved ulovlig postnummer");

is( Geo::Postcodes::NO::borough_number_of ("9999"),            undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::borough_number_of (undef),             undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::borough_number_of ("Ett eller annet"), undef, "Undef ved ulovlig postnummer");

is( Geo::Postcodes::NO::borough_of ("9999"),            undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::borough_of (undef),             undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::borough_of ("Ett eller annet"), undef, "Undef ved ulovlig postnummer");

is( Geo::Postcodes::NO::kommunenr2kommune ("9999"),            undef, "Undef ved ulovlig kommunenummer");
is( Geo::Postcodes::NO::kommunenr2kommune (undef),             undef, "Undef ved ulovlig kommunenummer");
is( Geo::Postcodes::NO::kommunenr2kommune ("Ett eller annet"), undef, "Undef ved ulovlig kommunenummer");

is( Geo::Postcodes::NO::county_of ("9999"),            undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::county_of (undef),             undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::county_of ("Ett eller annet"), undef, "Undef ved ulovlig postnummer");

is( Geo::Postcodes::NO::kommunenr2fylke ("9999"),            undef, "Undef ved ulovlig kommunenummer");
is( Geo::Postcodes::NO::kommunenr2fylke (undef),             undef, "Undef ved ulovlig kommunenummer");
is( Geo::Postcodes::NO::kommunenr2fylke ("Ett eller annet"), undef, "Undef ved ulovlig kommunenummer");

is( Geo::Postcodes::NO::type_of ("9999"),            undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::type_of (undef),             undef, "Undef ved ulovlig postnummer");
is( Geo::Postcodes::NO::type_of ("Ett eller annet"), undef, "Undef ved ulovlig postnummer");

#################################################################################
