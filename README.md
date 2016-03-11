# Upsite.


## How to create a Site in the console

```ruby
u = User.first
s = Site.create(title: 'Carl Sagan', owner: u)
m = SiteMembership.create(user: u, site: s)
```
