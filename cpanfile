requires 'perl', '5.014000';
requires 'Term::ANSIColor';
requires 'List::MoreUtils';
requires 'PPI';

on 'test' => sub {
    requires 'Test::More', '0.98';
};
