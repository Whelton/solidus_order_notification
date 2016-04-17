Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :order_notification_settings, only: [:edit, :update]
  end
end
