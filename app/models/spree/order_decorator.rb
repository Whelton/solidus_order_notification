Spree::Order.class_eval do
  alias_method :super_deliver_order_confirmation_email, :deliver_order_confirmation_email


  # Modified to also send notification email
  def deliver_order_confirmation_email
    super_deliver_order_confirmation_email # Call Super

    # Send notficiation email
    setting = Spree::OrderNotificationSetting.new
    if setting[:mailer_complete_enabled]
      to_addresses = setting[:mailer_complete_to].delete(' ').split(',')
      from_address = setting[:mailer_complete_from]
      cc_addresses = setting[:mailer_complete_cc].delete(' ').split(',')
      bcc_addresses = setting[:mailer_complete_bcc].delete(' ').split(',')

      Spree::OrderNotificationMailer.order_complete_state_email(
        id,
        to_addresses,
        from_address,
        cc_addresses,
        bcc_addresses
      ).deliver_later
    end
  end

end
