# Solidus Order Notification

Extension for notifications of orders.
Currently supports emails for new orders.

---

## Installation

1. Add the Solidus Order Notification gem to your `Gemfile`:
  ```ruby
  gem 'solidus_order_notification', github: 'whelton/solidus_order_notification', branch: 'master'
  ```

2. Run:
  ```sh
  $ bundle install
  ```

---

## Configuration

Preferences can be updated within the admin panel under "configuration" then "Order Notification".

Or you may set them with an initializer within your application:

```ruby
SpreeOrderNotification::Config.tap do |config|
  config.mailer_complete_enabled = true
  config.mailer_complete_to = 'admin@example.com'
  config.mailer_complete_cc = 'another@example.com,one_more@example.com' # Multiple
  config.mailer_complete_bcc = '' # No BCC
  config.mailer_complete_from = 'notification@example.com'
end
```

The default preferences are:

```ruby
{
  mailer_complete_enabled: false,
  mailer_complete_to: '',
  mailer_complete_cc: '',
  mailer_complete_bcc: '',
  mailer_complete_from: ''
}
```

The mailer view is currently more or less the same content as the default confirm email.
If you would like to modify, create `app/views/spree/order_notification_mailer/order_complete_state_email.html.erb` with the content you want.

---

Copyright (c) 2016 [James Whelton](https://github.com/Whelton), released under the New BSD License
