import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/config/api_config.dart';

void main() {
  const ApiConfig apiConfig = ApiConfig(
    appName: 'HR',
    flavorName: 'dev',
    apiBaseUrl: 'https://api.hr-dev.zamo.io/api/',
    momoMerchantName: 'Zamo LLC',
    momoMerchantCode: 'MOMOS9HI20191019',
    momoPartnerCode: 'MOMOS9HI20191019',
    momoAppScheme: 'momos9hi20191019'
  );
  runApp(App(apiConfig: apiConfig,));
}