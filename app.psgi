#!/usr/bin/perl

use Dancer2;

get '/hello/:name' => sub {
    return "Why, hello there " . param('name')."\n";
};

any ['get', 'post'] => '/myaction' => sub {
    return "any"
};

get '/cookie' => sub {
    my $cookie = cookies->{name};
    return $cookie->value;
};

get '/appname' => sub {
    return (
        "This is appname:" . config->{appname}."\n".
        "This is foo:" . config->{foo}
    );
};

get 'static/:file' => sub {
    content_type 'text/plain';
    send_file(params->{file});
};

dance;

