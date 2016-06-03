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
