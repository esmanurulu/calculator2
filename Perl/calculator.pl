#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

my %variables;

print "Perl Hesap Makinesi (Çıkış için 'exit' yazın)\n";

while (1) {
    print "İşlem giriniz: ";
    my $input = <STDIN>;
    chomp $input;
    
  
    last if $input =~ /^exit$/i;
    

    next if $input =~ /^\s*$/;
    
    
    if ($input =~ /\s*=\s*/) {
        my ($var, $expr) = split /\s*=\s*/, $input, 2;
        $var =~ s/^\s+|\s+$//g;
        
        my $value = eval_expr($expr);
        if ($@) {
            print "Hata: $@\n";
            next;
        }
        $variables{$var} = $value;
        next;
    }
    

    my $result = eval_expr($input);
    if ($@) {
        print "Hata: $@\n";
    } else {
        print "Sonuç: $result\n";
    }
}

sub eval_expr {
    my ($expr) = @_;
    $expr =~ s/\s+//g;  
    $expr =~ s/\^/**/g; 
    
  
    $expr =~ s/([a-zA-Z_]\w*)/$variables{$1} || die "Tanımsız değişken: $1"/ge;
    

    die "Geçersiz karakterler" unless $expr =~ /^[-+*\/\d().]+$/;
    die "Sıfıra bölme hatası" if $expr =~ /\/0/;
    
    my $result = eval $expr;
    die $@ if $@;
    return $result;
}
