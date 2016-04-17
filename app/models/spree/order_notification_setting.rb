module Spree
  class OrderNotificationSetting < Preferences::Configuration
    preference :mailer_complete_enabled, :boolean,   default: false
    preference :mailer_complete_to,      :string,    default: ''
    preference :mailer_complete_cc,      :string,    default: ''
    preference :mailer_complete_bcc,     :string,    default: ''
    preference :mailer_complete_from,    :string,    default: ''
  end
end
