import 'package:dio/dio.dart';
import 'package:hr_management_app/app/model/auth/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

/// User Api.
@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  /// Get user profile.
  @GET('users/{id}')
  Future<User> getUser(@Path() String id);

}

