Deface::Override.new(
  original:      'd1778b3a2e0c673a63b9cc6328f4fada49f7c0bb',
  virtual_path:  'spree/admin/shared/_configuration_menu',
  name:          'add_order_notification_tab',
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text:          '<%= configurations_sidebar_menu_item Spree.t(:order_notification), edit_admin_order_notification_settings_path %>'
)
