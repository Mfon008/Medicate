// ignore_for_file: constant_identifier_names

class UrlConfig {
  static const String refresh_token = 'auth/refresh';
  static const String set_pin = 'auth/set-pin';
  static const String send_otp = 'auth/send-otp';
  static const String sign_in = 'auth/login';
  static const String create_role = 'auth/create-role';
  static const String get_role = 'auth/get-roles';
  static const String update_role = 'auth/update-role';
  static const String delete_role = 'auth/delete-role';
  static const String create_user = 'tenant/create-staff';
  static const String get_user = 'tenant/staff';
  static const String update_user = 'tenant/staff/update';
  static const String delete_user = 'tenant/staff/deactivate';
  static const String sign_up = 'auth/register-user';
  static const String sign_up_hmo = 'auth/register-hmo';
  static const String sign_up_pharmacy = 'auth/register-pharmacy';
  static const String sign_up_manufacturer = 'auth/register-distributor';
  static const String sign_up_practitioner =
      'auth/register-healthcare-practitioner';
  static const String sign_up_business_owner =
      'auth/register-healthcare-provider';
  static const String user_detail = 'auth/user-details/';
  static const String user_detail_no_phone = 'auth/get-profile';
  static const String resend_otp = 'auth/resend-otp';
  static const String reset_password = 'auth/reset-pin';
  static const String verify_otp = 'auth/verify-otp';
  static const String verify_change_phone_otp = 'auth/verify-change-phone-otp';
  static const String verify_phone_otp = 'auth/verify-phone-otp';
  static const String forgot_pin = 'auth/forgot-pin';
  static const String change_number = 'auth/change-phonenumber/';
  static const String change_number_pharmacy = 'auth/change-phone';
  static const String change_pin = 'auth/change-pin';
  static const String uplaod_image = 'auth/upload-file';
  static const String get_tenant = 'auth/get-tenant-profile';
  static const String support = 'v1/api/support';
  static const String pharmacy = 'pharmacy';
  static const String upload_pro_picture =
      'auth/individual-user/upload/profile-picture';
  static const String update_user_profile = 'auth/update-profile';
  static const String update_hmo_profile = 'auth/update-hmo-profile';
  static const String update_pharmacy_profile = 'auth/update-pharmacy-profile';
  static const String update_healthcare_business_owner_profile =
      'auth/update-healthcare-provider-profile';
  static const String update_healthcare_practitioner_profile =
      'auth/update-healthcare-practitioner-profile';
  static const String reminder = 'reminders';
  static const String payment_retry = 'payment/retry';
  static const String payment_retry_quote = 'payment/retry-quote';
  static const String today_reminder = 'reminders/daily';
  static const String upload_image_reminder = 'reminders/image';
  static const String upload_updated_image_reminder = 'reminders';
  static const String upload_image_reminder_update =
      'reminders/medication-image';
  static const String initiate_payment = 'payment/initiate';
  static const String state = 'countries/states/q';
  static const String get_kyc = 'auth/get-kyc';
  static const String get_hmo_kyc = 'auth/hmo/kyc/status';
  static const String update_pharm_kyc = 'auth/upload-kyc';
  static const String update_hmo_kyc_two = 'auth/hmo/kyc/level-2/submit';
  static const String update_third_hmo_kyc_two = 'auth/hmo/kyc/level-3/submit';
  static const String listed_plan_types_hmo =
      'hmo/settings/plan-types/available';
  static const String listed_plan_tiers_hmo = 'hmo/settings/plan-tiers';
  static const String get_user_details_by_tenant =
      'auth/get-user-details-by-tenant';
  static const String register_user_by_tenant = 'auth/register-user-by-tenant';
  static const String reminders_tenant = 'reminders/tenant/';
  static const String get_transaction = '/wallet/transactions';
  static const String get_wallet = '/wallet/balance';
  static const String create_payment = '/payment/create';
  static const String pay_with_wallet = '/payment/pay-with-wallet';
  static const String get_user_hmos = 'hmos';
  static const String get_user_hmos_market = 'hmo/marketplace/plans';
  static const String get_user_hmos_market_plantype = 'hmo/marketplace/hmos';
  static const String get_user_hmos_plan = 'hmo/plans';
  static const String get_user_hmos_plan_marketplace = 'hmo/marketplace/plans';
  static const String selects_plan_type = 'hmo/settings/plan-types/select';
  static const String get_user_hmos_application = 'hmo/applications';
  static const String start_application = 'hmo/applications/start';
  static const String save_first_step = 'hmo/applications/save-step';
  static const String get_hospital_by_id = 'hmo/hospitals';
  static const String get_hospital_by_id_user = 'hmo/marketplace/hospitals';
  static const String submit_hmo_plan = 'hmo/applications/submit';
  static const String my_subscription = 'hmo/applications/my-subscriptions';
  static const String hmo_plan_teirs = 'hmo/settings/plan-tiers';
  static const String save_reminder_draft = 'reminders/drafts';
  static const String notification_pricing = 'reminders/notification-prices';
  static const String notification_device = 'notifications/devices';
  static const String read_all_notification = 'notifications/in-app/read-all';
  static const String get_unread_notification =
      'notifications/in-app/unread-count';
  static const String read_notification = 'notifications/in-app';
  static const String wholesale_categories = 'wholesale/categories';
  static const String wholesale_nafdac_verify = 'wholesale/nafdac/verify';
  static const String wholesale_products_images = 'wholesale/products/images';
  static const String wholesale_products = 'wholesale/products';

  static const String wholesale_incoming_orders = 'wholesale/incoming-orders';
  static const String wholesale_marketplace_products =
      'wholesale/marketplace/products';
  static const String wholesale_cart = 'wholesale/cart';
  static const String wholesale_add_to_cart = 'wholesale/cart/items';
  static const String wholesale_checkout_quote = 'wholesale/checkout/quote';
  static const String wholesale_checkout = 'wholesale/checkout';
  static const String wholesale_orders = 'wholesale/orders';
  static const String wholesale_checkout_delivery_options =
      'wholesale/checkout/delivery-options';
  static const String auth_distributor_profile = 'auth/distributor/profile';
  static const String auth_distributor_profile_pic =
      'auth/distributor/profile-picture';
  static const String auth_distributor_kyc_status =
      'auth/distributor/kyc/status';
  static const String auth_distributor_kyc_level_two_save =
      'auth/distributor/kyc/level-2/save';
  static const String auth_distributor_kyc_level_two_submit =
      'auth/distributor/kyc/level-2/submit';
  static const String auth_distributor_kyc_level_three_submit =
      'auth/distributor/kyc/level-3/submit';
}
