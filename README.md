git-grep-perl-statement
=======================

git-grep-perl-statement - Perl statement finder

git-grep-perl-statement searches source code by specified token, and print the matched whole statement.
This is useful when finding multiline method calling, or finding method definition.

Examples
========

```
% git grep-perl-statement colored
git-grep-perl-statement:61
colored($self->highlight_style, $_);
git-grep-perl-statement:85
say colored(
                ['bold'],
                "@{[ $file ]}:@{[ $_->line_number ]}"
            );
```