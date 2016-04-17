module Spree
  module Admin
    class OrderNotificationSettingsController < ResourceController
      def update
        config = Spree::OrderNotificationSetting.new

        preferences = params && params.key?(:preferences) ? params.delete(:preferences) : params

        # Validations
        # TODO: Move to Model?
        if params[:mailer_complete_enabled] == "1"

          # Make sure 'To' has a value
          if params[:mailer_complete_to].delete(' ').split(',').count == 0
            update_error_redirect(Spree.t(:order_notification_error_mailer_to_value_required)) and return
          end

          # Make sure 'From' is valid email address
          if (params[:mailer_complete_from] =~ Devise::email_regexp).nil?
            update_error_redirect(Spree.t(:order_notification_error_mailer_from_invalid_email)) and return
          end

          # Ensure To, CC, BCC are valid
          {
            'order_notification_mailer_to': :mailer_complete_to,
            'order_notification_mailer_cc': :mailer_complete_cc,
            'order_notification_mailer_bcc': :mailer_complete_bcc
          }.each do |key, value|
            params[value].delete(' ').split(',').each do |email|
              if (email =~ Devise::email_regexp).nil?
                update_error_redirect(Spree.t(:order_notification_error_update_invalid_format, preference: Spree.t(key.to_sym))) and return
              end
            end
          end
        end

        preferences.each do |name, value|
          next unless config.has_preference? name
          config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:order_notification))
        redirect_to edit_admin_order_notification_settings_path
      end

      private

        def update_error_redirect(message = "Error updating")
          flash[:error] = message
          redirect_to edit_admin_order_notification_settings_path
        end
    end
  end
end
