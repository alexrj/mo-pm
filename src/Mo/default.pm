package Mo::default;
my $MoPKG = "Mo::";
$VERSION = 0.25;

*{$MoPKG.'default::e'} = sub {
    my ($caller_pkg, $params, $exports) = @_;
    $params->{default} = sub {
        my ($method, $name, %args) = @_;
        $args{default} or return $method;
        sub {
            $#_
              ? $method->(@_)
                : ! exists $_[0]{$name}
                    ? $_[0]{$name} = $args{default}->(@_)
                    : $method->(@_)
        };
    };
};
