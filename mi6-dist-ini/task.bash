set -e

module=$(config module)

if test -z "$module"; then
  echo 'usage sparrow plg run mi6-dist-ini --cwd $PWD --param module=$module_name';
  exit 1
fi

dist_name=$(echo $module | awk '{gsub(/::/,"-")}; 1')

echo $dist_name

cat << EOF > dist.ini
; dist.ini
name = $module

[ReadmeFromPod]
; if you want to disable generating README.md from main module's pod, then:
disable = true
;
; if you want to change a file that generates README.md, then:
; filename = lib/Your/Tutorial.pod

[PruneFiles]
; if you want to prune files when packaging, then
; filename = utils/tool.pl
;
; you can use Perl6 regular expressions
; match = ^ 'xt/'
EOF

cat << EOF > .gitignore
lib/.precomp/
.precomp
*.tar.gz
$dist_name-*
EOF
