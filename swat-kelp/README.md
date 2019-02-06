# SYNOPSIS

Runs regression [swat](https://github.com/melezhik/swat) checks against a sample kelp application.

# Check List

* Kelp footprint get sent via http headers
* Placeholders for parameters

# INSTALL

    sparrow plg install swat-kelp

# USAGE

    sparrow plg run swat-kelp

# Kelp application

    package MyApp;
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
        $id
    }
    
    
    1;
    
# AUTHOR

Alexey Melezhik

