source ~/etc/profile
mkdir -p $ME/.zfunctions
fpath=($ME/.zfunctions $fpath)
autoload -U promptinit;     promptinit
autoload -Uz compinit;      compinit -u -d $ME_ZSH_CACHE_DIR/compdump.$ME_HOST
autoload colors;            colors
for f in $ME_ZSH_CONFIG_DIR/* ; do
  source $f
done
