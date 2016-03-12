# Upsite.


## How to create a Site in the console

```ruby
u = User.first
s = Site.create(name: 'syrrup', owner: u)
m = SiteMembership.create(user: u, site: s)
```
