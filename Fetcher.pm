package Fetcher;
use strict;
use Carp;
#ץȡָ�����ӣ��������ݻ��߿�
sub fetch{
    my $class = shift ;
    my $seed  = shift || Carp->croak("��Ҫseed����������");
    use LWP::UserAgent;
    use HTML::Tree;
    my $ua = LWP::UserAgent->new;
    $ua->agent("MyApp/0.1 ");
    ###�����վ####���о���վ�Ľṹ�����������ؼ��ʹ��ˡ�
    # Create a request
    my $req = HTTP::Request->new(GET => $seed);
    # Pass request to the user agent and get a response back
    my $res = $ua->request($req);
    # Check the outcome of the response
    if ($res->is_success) {
        my $content =  $res->content;
        return $content;
    }
    else {
        #print $res->status_line, "\n";
        return undef;
    }
}
1;
