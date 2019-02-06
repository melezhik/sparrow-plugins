use parent 'Kelp';

sub build {

    my $self = shift;
    my $r = $self->routes;

    $r->add( "/hello-world", sub { "Hello, world!" } );

    $r->add( '/hello/?name', 'greet' );

    $r->add( "/update/:id", "update" );

    $r->add( [ POST => '/postme' ], sub { 'i am post only!' }  );

}


sub greet {

    my ( $self, $name ) = @_;
    "Hello " . ($name || 'world')

}


sub update {
    my ( $self, $id ) = @_;
    "update id: $id"
}

sub update_article {
    my ( $self, $article, $id ) = @_;
    "update article: $article id: $id"
}


1;

my $app = __PACKAGE__->new;
$app->run;

