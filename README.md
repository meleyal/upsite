# Upsite

## How to create a Site in the console

```ruby
require 'hirb'
Hirb.enable

u = User.find(id)
s = Site.create(name: 'name', owner: u)
m = SiteMembership.create(user: u, site: s)
```
