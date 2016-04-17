module Spree
  class OrderNotificationMailer < BaseMailer

    # Notification email saying that a new order is at complete state
    def order_complete_state_email(order, to_addresses, from_address, cc_addresses = '', bcc_addresses = '')
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      subject = Spree.t(:order_notification_mailer_complete_subject, start: Spree::Store.current.name, end: ('#'+@order.number))

      mail(
        to: to_addresses,
        from: from_address,
        cc: cc_addresses,
        bcc: bcc_addresses,
        subject: subject
      )
    end

  end
end
