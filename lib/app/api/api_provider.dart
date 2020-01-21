import 'package:dio/dio.dart';
import 'package:hr_management_app/app/auth/auth_interceptor.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'auth/auth_api.dart';
import 'auth/user_api.dart';


/// Api provider.
class ApiProvider {
  ApiProvider(String baseUrl) {
    _initDio(baseUrl);
  }

  Dio dio;
  AuthApi _authApi;
  UserApi _userApi;
  DefaultCacheManager _cacheManager;
  Function() _onUnauthorized;


  void _initDio(String baseUrl) {
    final BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;

    dio = Dio(dioOptions);
    dio.interceptors
      ..add(LogInterceptor(requestBody: true, responseBody: true))
      ..add(AuthInterceptor(this, () => _onUnauthorized));
  }

  /// Register [onUnauthorized] event to receive error if backend responds 401.
  void registerUnauthorizedEvent(Function() onUnauthorized) {
    _onUnauthorized = onUnauthorized;
  }

  /// Get auth api.
  AuthApi get authApi {
    _authApi ??= AuthApi(dio);
    return _authApi;
  }

  /// Get cache manager.
  DefaultCacheManager get cacheManager {
    _cacheManager ??= DefaultCacheManager();
    return _cacheManager;
  }

  /// Get user api.
  UserApi get userApi {
    _userApi ??= UserApi(dio);
    return _userApi;
  }

}
