# oc-get-pods

Get openshift pods

# Install

    s6 --install oc-get-pods

# Usage

Raku

    my %data = task-run "my pods", "oc-get-pods" %(
      namespace => "cats"
    );

    use Data::Dump;

    my $j = 0;

    for %data<items><>.grep({ .<metadata><name>  ~~ /'homecat'/ }) -> $i {
      say $i<metadata><name>;
      say Dump($i, :color(True));
    }

# Dependencies

`oc cli`

# Author

Aleksei Melezhik


