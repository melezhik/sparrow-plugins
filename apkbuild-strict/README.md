# apkbuild-strict

Validate APKBUILD files using Sparrow6 Task Check DSL:

- verify maintainer identity
- verify that pkgrel is set and differs from the current package version

# Install

```bash
% zef install Sparrow6 --/test

```
# How to run

```bash
% s6 --task-run .@path=examples/APKBUILD
```

# Parameters

## path

Path to apk file, optional, default value is `APKBUILD`


# Report example

```
% s6 --task-run .@path=examples/APKBUILD
19:44:36 :: [sparrowtask] - run sparrow task .@path=examples/APKBUILD
19:44:37 :: [sparrowtask] - run [.], thing: .@path=examples/APKBUILD
[task run: task.bash - .]
[task stdout]
19:44:37 :: # Contributor: Rasmus Thomsen <oss@cogitri.dev>
19:44:37 :: # Contributor: fossdd <fossdd@pwned.life>
19:44:37 :: maintainer="Celeste <cielesti@protonmail.com>"
19:44:37 :: pkgname=mautrix-whatsapp
19:44:37 :: pkgver=0.11.3
19:44:37 :: pkgrel=1
19:44:37 :: pkgdesc="Matrix-WhatsApp puppeting bridge"
19:44:37 :: url="https://maunium.net/go/mautrix-whatsapp"
19:44:37 :: arch="all"
19:44:37 :: license="AGPL-3.0-or-later"
19:44:37 :: makedepends="go olm-dev sqlite-dev"
19:44:37 :: install="$pkgname.pre-install $pkgname.pre-upgrade $pkgname.post-upgrade"
19:44:37 :: subpackages="$pkgname-openrc"
19:44:37 :: source="$pkgname-$pkgver.tar.gz::https://github.com/mautrix/whatsapp/archive/v$pkgver.tar.gz
19:44:37 :: 	mautrix-whatsapp.initd
19:44:37 :: 	mautrix-whatsapp.confd
19:44:37 :: 	"
19:44:37 :: builddir="$srcdir/whatsapp-$pkgver"
19:44:37 :: options="net" # downloading go modules
19:44:37 :: 
19:44:37 :: export GOFLAGS="$GOFLAGS -tags=libsqlite3"
19:44:37 :: export GOCACHE="${GOCACHE:-"$srcdir/go-cache"}"
19:44:37 :: export GOTMPDIR="${GOTMPDIR:-"$srcdir"}"
19:44:37 :: export GOMODCACHE="${GOMODCACHE:-"$srcdir/go"}"
19:44:37 :: 
19:44:37 :: build() {
19:44:37 :: 	export CGO_CFLAGS="$CFLAGS"
19:44:37 :: 	export CGO_LDFLAGS="$LDFLAGS"
19:44:37 :: 	local _goldflags="
19:44:37 :: 		-X main.Tag=$pkgver
19:44:37 :: 		-X 'main.BuildTime=$(date -d @"$SOURCE_DATE_EPOCH" '+%b %_d %Y, %H:%M:%S')'
19:44:37 :: 		"
19:44:37 :: 
19:44:37 :: 	go build -ldflags "$_goldflags" ./cmd/mautrix-whatsapp
19:44:37 :: 
19:44:37 :: 	# write example config.yaml for installing in package()
19:44:37 :: 	./mautrix-whatsapp -e
19:44:37 :: }
19:44:37 :: 
19:44:37 :: check() {
19:44:37 :: 	go test -v ./...
19:44:37 :: }
19:44:37 :: 
19:44:37 :: package() {
19:44:37 :: 	install -Dm755 mautrix-whatsapp \
19:44:37 :: 		-t "$pkgdir"/usr/bin/
19:44:37 :: 	install -Dm644 config.yaml \
19:44:37 :: 		-t "$pkgdir"/etc/mautrix-whatsapp/
19:44:37 :: 
19:44:37 :: 	install -Dm755 "$srcdir"/mautrix-whatsapp.initd \
19:44:37 :: 		"$pkgdir"/etc/init.d/mautrix-whatsapp
19:44:37 :: 	install -Dm644 "$srcdir"/mautrix-whatsapp.confd \
19:44:37 :: 		"$pkgdir"/etc/conf.d/mautrix-whatsapp
19:44:37 :: }
19:44:37 :: 
19:44:37 :: sha512sums="
19:44:37 :: 21bad4afbdd5a5d9337e9ab3a045dc6a2784d17a26f76728e73e423baaef3dd948c1ba09e4961341854dda4d257c2d5a0c3c6d811d1445c03c256013d4cf7934  mautrix-whatsapp-0.11.3.tar.gz
19:44:37 :: 320ec426f033e93297bb3dd2ebe6996a9a677c53e76e8eb6d4b6f2bb24c1c756ef8d38d2dbb0d038369507fd9bf4864e73ab86783be3f6bbca150fe46a669841  mautrix-whatsapp.initd
19:44:37 :: 9349b660273c63d2973f1b99ddbd98469dddc098157380603210159f17d3cb1eb55e71dbd21550b20d40831f4da320225e7c03441667e2750e30a2e1fa03acfe  mautrix-whatsapp.confd
19:44:37 :: "
|> source changed to [/tmp/pkg.info]
19:44:41 :: mautrix-whatsapp-0.12.2-r0 description:
19:44:41 :: Matrix-WhatsApp puppeting bridge
19:44:41 :: 
[task check]
# <<<
# check if required fields are set
# >>>
# 
# maintainer
# ==========
# Should be a well-formatted, 
# example is: maintainer="John Snow <john_snow@thewall.net>"
stdout match (w) <^^ "maintainer=" (.*) $$> True
stdout match (w) <^^ \" (.*) \" $$> True
# maintainer line found: Celeste <cielesti@protonmail.com>
# check maintainer identity
stdout match (w) <(<[ \w \s ] >+?) "<" (<[ \w \. ] > + \@ <[ \w \. ] > + ) ">" \s* $$> True
# Name: Celeste 
# Email: cielesti@protonmail.com
<maintainer line is not broken> True
stdout match <^^ "pkgname=" (\S+)> True
# run apk info mautrix-whatsapp command and save output to file (/tmp/pkg.info)
# get pkgrel from file
stdout match <^^ \s* "pkgrel=" (\d+) \s* $$> True
# pkgrel found: 1
# get pkgrel from apk info command output
stdout match <.*  "-" r(\S+) \s+ "description:" $$> True
# pkgrel found: 0
<pkgrel from file differs from pkgrel from apk info command output> True
```
