* Add `devise` and `devise-api` to `Gemfile`
* `bundle install`
* `rails g devise:install && rails g devise user`
* `rails g devise_api:install`
* `rails active_storage:install`
* `rails g scaffold image image_file`
* Move `ImagesController` to `app/controllers/api/latest`
* Update `routes.rb`
* Update `cors.rb`
* `rails db:migrate`