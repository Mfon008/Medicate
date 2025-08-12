import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepoImpl {
  // final _session = locator<SharedPreferencesService>();
  // final _contract = locator<AuthContractsImpl>();


  // Future<SignInResponseModel> signIn(SignInEntityModel signInEntity) async {
  //   final response = await _contract.signIn(signInEntity);
  //   _chache(response);
  //   _session.isLoggedIn = true;
  //   return response;
  // }

  
  // void _chache(data) {
  //   if (data != null) {
  //     print('datatata printing::: $data');
  //     _session.authToken = data.jwt;
  //     // _session.usersData = data.toJson();
  //   }
  // }
}
