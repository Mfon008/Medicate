// ignore_for_file: constant_identifier_names

class UrlConfig {
  static const String refresh_token = 'auth/refresh-token';
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
  static const String today_reminder = 'reminders/daily';
  static const String upload_image_reminder = 'reminders/image';
  static const String upload_image_reminder_update =
      'reminders/medication-image';
  static const String initiate_payment = 'payment/initiate';
  static const String state = 'countries/states/q';
  static const String get_kyc = 'auth/get-kyc';
  static const String update_pharm_kyc = 'auth/upload-kyc';

  static const String get_user_details_by_tenant = 'auth/get-user-details-by-tenant';
  static const String register_user_by_tenant = 'auth/register-user-by-tenant';
  static const String reminders_tenant = 'reminders/tenant/';
  // static const String get_user_details_by_tenant = 'auth/get-user-details-by-tenant';
}
