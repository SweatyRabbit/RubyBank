# RUBY BANK

## About project

This is a simple RubyBank project where you can register a new account or log in existing account. You can transfer money from your credit card to another and see your transactions.

## How to install

1) You need to have ruby 3.2.2 version and Rails 7.1.1
2) Open project, run `bundle install` to install all gems
3) Run `rails db:create` to create database
4) Run `rails db:migrate` to apply pending migrations
5) Run `rails db:seed` to create default data
6) Run `rails s` to start server and feel free to use! (Notice: you need to setup in .env (create if you don't have one) file SMTP username and password to catch mails)
7) Run `rspec` to run all tests
8) Also, you can create new user with credit card via FactoryBot:
  * Open terminal
  * Create user: `user = FactoryBot.create(:user, email: 'your_email.@gmail.com', password: 'your_password')`
  * Create credit card for user: `FactoryBot.create(:credit_card, user: user)`

## Quality gates

1) RuboCop - static code analyzer and formatter based on the community Ruby style guide.
2) Lefthook - hooks manager that allows to enforce checks and actions at different stages of Git workflow.
3) Fasterer - check performance issues.
