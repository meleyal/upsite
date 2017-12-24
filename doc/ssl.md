# SSL Certificate

sudo certbot certonly --manual

Your certificate and chain have been saved at:
/etc/letsencrypt/live/www.upsite.io/fullchain.pem

Your key file has been saved at:
/etc/letsencrypt/live/www.upsite.io/privkey.pem

Your cert will expire on 2018-03-24. To obtain a new or tweaked
version of this certificate in the future, simply run certbot
again. To non-interactively renew _all_ of your certificates, run
"certbot renew"

sudo heroku certs:add /etc/letsencrypt/live/www.upsite.io/fullchain.pem /etc/letsencrypt/live/www.upsite.io/privkey.pem
