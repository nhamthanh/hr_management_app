import 'package:dio/dio.dart';
import 'package:hr_management_app/app/api/api_provider.dart';
import 'package:hr_management_app/app/model/auth/token.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Auth interceptor.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.apiProvider, this.onUnauthorized);

  final ApiProvider apiProvider;
  final Function() onUnauthorized;

  final Logger _logger = Logger('ApiProvider');

  // ApiError _parseApiError(DioError error) {
  //   ApiError apiError = ApiError(message: 'Có lỗi hệ thống. Vui lòng liên hệ admin để được hỗ trợ.');
  //   try {
  //     apiError = ApiError.fromJson(error.response?.data);
  //   } catch (error) {
  //     _logger.fine(error?.message);
  //   }
  //   return apiError;
  // }

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    options.headers['Context-Type'] = 'application/json';
    final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    final String token = _sharedPreferences.getString('token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ' + token;
    }
    return options;
  }

  @override
  Future<dynamic> onError(DioError err) async {
    _logger.fine(err.message);
    if (err.response?.statusCode == 401 && err.request.path != 'login') {
      if (err.request.headers != null && !err.request.headers.containsKey('Retry')) {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        final String email = sharedPreferences.get('email');
        final String password = sharedPreferences.get('password');
        if (email != null) {
          final Token token = await apiProvider.authApi.login(<String, String>{
            'username': email,
            'password': password
          });

          await sharedPreferences.setString('token', token.token);
          err.request.headers['Retry'] = true;
          return await apiProvider.dio.request<dynamic>(
            err.request.path,
            data: err.request.data,
            queryParameters: err.request.queryParameters,
            options: RequestOptions(
              method: err.request.method,
              headers: err.request.headers
            )
          );
        }
      }

      // final AuthService authService = AuthService(apiProvider);
      // await authService.clearUser();
      onUnauthorized();
    }
    // err.response?.extra['apiError'] = _parseApiError(err);
    // return err;
  }

  @override
  Future<Response<dynamic>> onResponse(Response<dynamic> response) async {
    return response;
  }
}
