
Launch:

- [ ] deploy
- [ ] run rake tasks on heroku:
    rake db:migrate
    rake subscribe_all_users_to_free_plan
    rake update_plans
- [ ] test


Done:

- [x] downgrade if payment declined
- [x] upgrade should link to settings/account
- [x] extend :plan_active_until
- [x] use: Stripe::Event.retrieve
- [x] update marketing copy with free limits
- [x] add :stripe_customer_id to User
- [x] add :plan_active_until timestamp to site
- [x] add Subscription model
- [x] Create :free + :pro_5 plans in Stripe + DB
- [x] Update Plan model
- [x] Add new users to free plan / subscription (+ Stripe)
- [x] add limits based on current plan
- [x] implement custom form (create new Subscription)
- [x] update subscription on successful stripe payment
- [x] add billing tab (show sub, cancel)



References:

- https://stripe.com/docs/subscriptions/guide
- https://launchschool.com/blog/stripe-recurring
