# SYNOPSIS

Runs regression [swat](https://github.com/melezhik/swat) checks against a sample Dancer2 application.

# Check List

- placeholders for parameters
- get, post requests
- cookies
- sending static files
- config parameters

# INSTALL

    sparrow plg install swat-dancer2

# USAGE

    sparrow project create dancer-check
    sparrow project check_add dancer-app-check
    sparrow check_set dancer-app-check -p swat-dancer2 -u 127.0.0.1:5000
    sparrow check_run

# Dancer application

    #!/usr/bin/perl
    
    use Dancer2;
    
    set public_dir => "$ENV{project_root_dir}/public";
    
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
        return "This is " . config->{appname};
    };
    
    get 'static/:file' => sub {
        content_type 'text/plain';
        send_file(params->{file});
    };
    
    dance;
    
# Sample output 

    /home/vagrant/.swat/.cache/28936/prove/config_parameters/00.GET.t .... ok
    /home/vagrant/.swat/.cache/28936/prove/dancer_cookies/00.GET.t ....... ok
    /home/vagrant/.swat/.cache/28936/prove/dancer_placeholders/00.GET.t .. ok
    /home/vagrant/.swat/.cache/28936/prove/dancer_send_file/00.GET.t ..... ok
    /home/vagrant/.swat/.cache/28936/prove/method_any/00.GET.t ........... ok
    
# AUTHOR

Alexey Melezhik

