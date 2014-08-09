package App::GitGrepPerlStatement;
use 5.014000;
use strict;
use warnings;
use PPI;
use List::MoreUtils qw(any);
use Term::ANSIColor;

our $VERSION = "0.01";

sub new {
    my ($class, $word) = @_;
    bless {
        word => $word,
        docs => [],
    }, $class;
}

sub word {
    my ($self) = @_;
    $self->{word};
}

sub search {
    my ($self, $file) = @_;

    my $doc = PPI::Document->new($file);
    return unless $doc;
    push @{$self->{docs}}, $doc;

    my $statements = $doc->find('PPI::Statement');

    grep {
        my $tokens = [ $_->children ];

        any {
            $_ eq $self->word;
        } @$tokens;
    } @$statements;
}

sub flush {
    my ($self) = @_;
    $self->{docs} = [];
}

sub highlight_style {
    ['red'];
}

sub highlight {
    my ($self, $statement) = @_;

    join '', map {
        if ($_ eq $self->word) {
            colored($self->highlight_style, $_);
        } else {
            $_;
        }
    } $statement->children;
}

1;
__END__

=encoding utf-8

=head1 NAME

App::GitGrepPerlStatement - Perl statement finder

=head1 SYNOPSIS

    use App::GitGrepPerlStatement;

=head1 DESCRIPTION

App::GitGrepPerlStatement is the frontend of L<git-grep-perl-statement>

=head1 SEE ALSO

L<git-grep-perl-statement>

=head1 LICENSE

Copyright (C) hitode909.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

hitode909 E<lt>hitode909@gmail.comE<gt>

=cut

