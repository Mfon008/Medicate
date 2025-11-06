// ignore_for_file: constant_identifier_names

class UrlConfig {
  static const String refresh_token = 'auth/refresh-token';
  static const String set_pin = 'auth/set-pin';
  static const String sign_in = 'auth/login';
  static const String sign_up = 'auth/register-user';
  static const String sign_up_pharmacy = 'auth/register-pharmacy';
  static const String user_detail = 'auth/user-details/';
  static const String resend_otp = 'auth/resend-otp';
  static const String reset_password = 'auth/reset-pin';
  static const String verify_otp = 'auth/verify-otp';
  static const String verify_phone_otp = 'auth/verify-phone-otp';
  static const String forgot_password = 'auth/forgot-password';
  static const String forgot_pin = 'auth/forgot-pin';
  static const String verify_forget_pin_otp = 'auth/verify-forgot-pin-otp';
  static const String change_number = 'auth/change-phonenumber/';
  static const String change_pin = 'auth/change-pin';
  static const String support = 'v1/api/support';
  static const String upload_pro_picture =
      'auth/individual-user/upload/profile-picture';
  static const String update_user_profile = 'auth/individual-user/update';
  static const String reminder = 'reminders';
  static const String today_reminder = 'reminders/daily';
  static const String upload_image_reminder = 'reminders/image';
  static const String upload_image_reminder_update =
      'reminders/medication-image';
  static const String initiate_payment = 'payment/initiate';
}
