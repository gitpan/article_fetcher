package Filter;
use strict;
use Carp;
use File::Slurp;
##���ݹؼ��ֹ���####
sub accept_it {
    my $class = shift;
    my  $news_content = shift ||"";
    ##�������ļ���ȡ�ؼ���###
    my @kws= read_file( 'keywords/kws.txt' ) ;
    foreach my $kw (@kws){
        $kw =~ s/\n//;
        ##ֻҪƥ��һ���ؼ��־�ok##
        if($news_content =~ /$kw/im){
            return 1;
        }else{
            return 0;
        }
    }

}



1;
