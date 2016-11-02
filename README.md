# Upsite

## How to create a Site in the console

```ruby
require 'hirb'
Hirb.enable

u = User.find(id)
s = Site.create(name: 'name', owner: u)
m = SiteMembership.create(user: u, site: s)
```

## Find users with more than 1 site

```
User.joins(:sites).group('users.id').having('count(sites.id) > ?', 1)
```

## Find sites/users with less than 2 blocks

```
Site.all.reject {|s| s.blocks.count > 2 }.map {|s| s.owner }
```

## Get all user emails

```
User.all.map(&:email).join(', ')
```

## Renew SSL cert

- Your certificate and chain have been saved at
  `/etc/letsencrypt/live/www.upsite.io/fullchain.pem`

- Your cert will expire on 2016-12-31.

- To obtain a new or tweaked version of this certificate in the future, simply run certbot again.
  To non-interactively renew *all* of your certificates, run `certbot renew`.
