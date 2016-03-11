


- push to heroku
   git push heroku
   heroku run rake db:reset db:migrate db:seed

- change default seed passwords
    heroku run rails console
    u = User.first/last
    u.password = generated


Later

- upgrade heroku plan
- add S3 to Cyberduck
- import live db script
- staging env?
- caching
- force www redirect?
- explore / tags / community
- password reset?
- remember me
- delete site (deactivate)
- oauth login
- stats
- replace embedly (oembed, custom?)
- replace jquery-ui with html5sortable
- merge website + application layout/js/css
- cleanup dropzone on closing image modal
- mobile layout
