###############################################################################
#                                                                             #
#        Geo::Postcodes::NO Test Suite 3 - The 'selection' procedure          #
#        -----------------------------------------------------------          #
#               Arne Sommer - arne@cpan.org  - 19. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 3_selection.t'.   #
#                                                                             #
###############################################################################

use Test::More tests => 9;

BEGIN { use_ok('Geo::Postcodes::NO') };

###############################################################################

my @loc = qw(3001 3002 3003 3004 3005 3006 3007 3008 3011 3012 3013 3014 3015
             3016 3017 3018 3019 3020 3021 3022 3023 3024 3025 3026 3027 3028
             3029 3030 3031 3032 3033 3034 3035 3036 3037 3038 3039 3040 3041
             3042 3043 3044 3045 3046 3047 3048);

my @loc1 = Geo::Postcodes::NO::selection(location => 'DRAMMEN');
is_deeply(\@loc1, \@loc,                "location => 'DRAMMEN'");

###############################################################################

my @bor = qw(1371 1372 1373 1375 1376 1377 1378 1379 1380 1381 1383 1384 1385
             1386 1387 1388 1389 1390 1391 1392 1393 1394 1395 1396 1397 1399);

my @bor1 = Geo::Postcodes::NO::selection(borough    => 'ASKER');
is_deeply(\@bor1, \@bor,                "borough    => 'ASKER'");

my @bor2 = Geo::Postcodes::NO::selection(borough    => 'asker');
is_deeply(\@bor2, \@bor,                "borough    => 'asker'");

###############################################################################

my @bno  = qw(9990 9991);
my @bno1 = Geo::Postcodes::NO::selection(borough_number => '2028');
is_deeply(\@bno1, \@bno,                "borough_number => '2028'");

###############################################################################

my @cou  = qw(9170 9171 9172 9173 9174 9175 9176 9177 9178 9179);
my @cou1 = Geo::Postcodes::NO::selection(county     => 'SVALBARD');
is_deeply(\@cou1, \@cou,                "county     => 'SVALBARD'");

###############################################################################

my @typ = qw(1602 1714 2226 2326 2418 2626 2808 2809 2810 3504 3601 4509 4604
             4605 4606 4808 4809 4898 5020 5409 6025 6405 6504 6706 6807 7004
	     7005 7366 7462 7463 7483 7484 7485 7486 7488 7489 7491 7492 7493
	     7495 7496 7498 7499 7506 7609 7659 7728 7729 7809 8002 8037 8038
	     8039 8041 8205 8305 8375 8405 8446 8452 8512 8607 8654 8805 8905
	     9291 9292 9293 9294 9296 9306 9479 9480 9613 9712 9755 9815 9917);
my @typ1 = Geo::Postcodes::NO::selection(type       => 'SX');
is_deeply(\@typ1, \@typ,                "type       => 'SX'");

my @typ2 = Geo::Postcodes::NO::selection(type_verbose => 'Serviceboks');
is_deeply(\@typ2, \@typ,                "type         => 'Serviceboks'");

###############################################################################

my @oo2;

foreach  (Geo::Postcodes::NO::selection(county     => 'SVALBARD'))
{
  push @oo2, Geo::Postcodes::NO->new($_);
}

my @oo1 = Geo::Postcodes::NO->selection(county     => 'SVALBARD');
  ## As above, but as full Geo::Postcodes::NO objects .

is_deeply(\@oo1, \@oo2, "List of objects");

###############################################################################
