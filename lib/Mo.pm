package Mo;
$VERSION=0.25;
no warnings;my$K=__PACKAGE__.::;*{$K.Object::new}=sub{bless{@_[1..$#_]},$_[0]};*{$K.import}=sub{import warnings;$^H|=1538;my$P=caller.::;shift;my(%f,%e);eval"no Mo::$_",&{$K.$_.::e}($P,\%f,\%e,\@_)for@_;%e=(extends,sub{eval"no $_[0]()";@{$P.ISA}=$_[0]},has,sub{my$n=shift;my$m=sub{$#_?$_[0]{$n}=$_[1]:$_[0]{$n}};$m=$f{$_}->($m,$n,@_)for keys%f;*{$P.$n}=$m},%e,);*{$P.$_}=$e{$_}for keys%e;@{$P.ISA}=$K.Object};
