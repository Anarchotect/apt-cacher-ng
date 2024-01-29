# apt-cacher-ng
Docker container for Apt Cacher

This container includes apt-cacher-ng along with some repository mappings to deal with HTTPS for some of the repos I use

Run with:
```
docker run -d --restart always -v /srv/apt-cacher-ng/:/var/cache/apt-cacher-ng/ -p 3142:3142 anarchotect/apt-cacher-ng
```

Direct apt to the instance with the following in `/etc/apt/apt.conf.d/proxy.conf`:
```
Acquire {
  HTTP::proxy "http://localhost:3142";
  HTTPS::proxy "http://localhost:3142";
}
```

Your source, in DEB822 format, should look something like this for faked HTTPS sources: `/etc/apt/sources.list.d/wine.sources`:
```
Types: deb
URIs: http://fake.wine.com/
Suites: bookworm
Architectures: amd64 i386
Components: main
Signed-By: /etc/apt/keyrings/wine.gpg
```
Assuming OpenPGP Public Key for the source exists in `/etc/apt/keyrings/`
