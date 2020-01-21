import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'api/api_provider.dart';
import 'config/api_config.dart';

/// App context to store configurations and variables for router, database, API of the application.
@immutable
class AppContext {
  const AppContext({
    @required this.router,
    @required this.apiProvider,
    @required this.apiConfig,
  })  : assert(router != null),
        assert(apiConfig != null);

  final Router router;
  final ApiConfig apiConfig;
  final ApiProvider apiProvider;
}
