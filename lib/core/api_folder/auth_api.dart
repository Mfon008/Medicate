// import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
// import '../connect_end/model/sign_in_entity_model.dart';
// import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
// import '../core_folder/network/network_service.dart';
// import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  // final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  // Future<SignInResponseModel> signIn(SignInEntityModel signInEntity) async {
  //   try {
  //     final response = await _service.call(
  //       UrlConfig.sign_in,
  //       RequestMethod.post,
  //       data: signInEntity.toJson(),
  //     );
  //     logger.d(response.data);
  //     return SignInResponseModel.fromJson(response.data);
  //   } catch (e) {
  //     logger.d("response:$e");
  //     rethrow;
  //   }
  // }

 }
