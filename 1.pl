#!/usr/bin/perl
use strict;
use warnings;


sub main {
    my $filename = "";
    my @lines;

    print "Jednostavni tekst editor (Perl)\n";

    while (1) {
        print "Odaberi:\n";
        print "1. Stvori novu datoteku\n";
        print "2. Otvori datoteku\n";
        print "3. Spremi\n";
        print "4. Dodaj tekst u datoteku\n";
        print "5. Promjeni tekst datoteke\n";
        print "6. Procitaj datoteku\n";
        print "7. Izadji\n";
        print "Unesi odabir: ";

        my $choice = <STDIN>;
        chomp $choice;
        print "___________________________________\n\n";


        #STVARANJE NOVE DATOTEKE
        if ($choice eq '1') {
            print "Unesi novo ime datoteke: ";
            $filename = <STDIN>;
            chomp $filename;
            @lines = ();

            if (open my $new_file, '>', $filename) {
                close $new_file;
                print "Nova datoteka uspjesno kreirana.\n";
            } else {
                print "Error: Novu datoteku nemoguce kreirati.\n";
            }
            print "___________________________________\n\n";
        }

        #OTVARANJE DATOTEKE
        elsif ($choice eq '2') {
            print "Unesi ime datoteke: ";
            $filename = <STDIN>;
            chomp $filename;

            if (open my $file, '<', $filename) {
                @lines = <$file>;
                close $file;
                print "Datoteka uspjesno otvorena.\n";
            } else {
                print "Error: Datoteku nemoguce otvoriti.\n";
            }
            print "___________________________________\n\n";
        }

        #SPREMANJE DATOTEKE
        elsif ($choice eq '3') {
            if ($filename) {
                if (open my $file, '>', $filename) {
                    print $file join("\n", @lines);
                    close $file;
                    print "Datoteka uspjesno spremljena.\n";
                } else {
                    print "Error: Spremanje datoteke neuspjesno.\n";
                }
            } else {
                print "Error: Datoteka trenutno nije otvorena.\n";
            }
            print "___________________________________\n\n";
        }

        #DODAVANJE NOVOG TEKSTA
        elsif ($choice eq '4') {
            if ($filename) {
                print "Unesi tekst koji dodajem (unesi 'END' za kraj unosa):\n";
                while (my $new_line = <STDIN>) {
                    chomp $new_line;
                    last if $new_line eq 'END';
                    push @lines, $new_line;
                }
                print "Tekst uspjesno dodan.\n";
            } else {
                print "Error: Datoteka trenutno nije otvorena.\n";
            }
            print "___________________________________\n\n";
        }

        #MIJENJANJE TEKSTA
        elsif ($choice eq '5') {
            if ($filename) {
                print "Unesi broj retka koji mijenjam: ";
                my $line_number = <STDIN>;
                chomp $line_number;

                if ($line_number >= 0 && $line_number <= scalar @lines) {
                        print "Unesi novi tekst za redak broj $line_number (unesi '0' za brisanje retka):\n";
                        my $new_line = <STDIN>;
                        chomp $new_line;

                        if ($new_line eq '0') {
                            splice @lines, $line_number - 1, 1;
                            print "Redak $line_number izbrisan.\n";
                        } else {
                            $lines[$line_number - 1] = $new_line;
                            print "Promjena nad retkom $line_number uspjesna.\n";
                        }
                } else {
                    print "Error: Redak broj $line_number nije u dosegu.\n";
                }
            } else {
                print "Error: Datoeka trenutno nije otvorena.\n";
            }
            print "___________________________________\n\n";
   
        }

        #CITANJE TEKSTA DATOTEKE
        elsif ($choice eq '6') {
            if (@lines) {
                print "Sadrzaj datoteke:\n";
                print "$_\n" for @lines;
            } else {
                print "Error: Datoteka trenutno nije otvorena.\n";
            }
            print "___________________________________\n\n";
        }

        #IZLAZ IZ PROGRAMA
        elsif ($choice eq '7') {
            print "Izlaz....\n";
            last;
        }
        else {
            print "Krivi odabir. Pokusaj ponovno.\n";
        }
        print "___________________________________\n\n";
    }
}

main();
