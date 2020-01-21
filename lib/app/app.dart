import 'package:bloc/bloc.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'api/api_provider.dart';
import 'app_bloc.dart';
import 'app_bloc_delegate.dart';
import 'app_context.dart';
import 'app_state.dart';
import 'auth/auth_provider.dart';
import 'common/app_colors.dart';
import 'common/splash.dart';
import 'config/api_config.dart';
import 'config/app_routes.dart';

/// Main stateful widget of the application.
class App extends StatefulWidget {
  const App({Key key, @required this.apiConfig}) : super(key: key);

  final ApiConfig apiConfig;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppBloc _appBloc;

  @override
  void initState() {
    super.initState();

    BlocSupervisor.delegate = AppBlocDelegate();
    final ApiProvider apiProvider = ApiProvider(widget.apiConfig.apiBaseUrl);
    final Router router = Router();
    AppRoutes.configureRoutes(router);


    _appBloc = AppBloc(AppContext(
      apiProvider: apiProvider,
      router: router,
      apiConfig: widget.apiConfig,
    ));

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (BuildContext context) => _appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        bloc: _appBloc,
        builder: (BuildContext context, AppState state) {
          // ignore: always_specify_types
          return MaterialApp(
            title: 'HR Application',
            debugShowCheckedModeBanner: false,
            theme: _buildThemeData(state),
            home: AuthProvider(
              apiProvider: _appBloc.appContext.apiProvider,
              handleUnauthorized: _handleUnauthorized,
              child: Splash()
            )
          );
        }
      )
    );
  }

  void _handleUnauthorized(BuildContext context) {
    try {
      _appBloc.appContext.router.navigateTo(context, AppRoutes.loginRoute, transition: TransitionType.fadeIn);
    } catch(error) {
      print(error);
    }
  }

  ThemeData _buildThemeData(AppState state) {
    if (state == AppState.light) {
      return ThemeData(
        brightness: Brightness.light,
        accentColor: AppColors.lightAccentColor,
        primaryColor: AppColors.lightPrimaryColor,
        primaryTextTheme: const TextTheme(
          title: TextStyle(
            color: Colors.white
          )
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),
        fontFamily: 'Muli'
      );
    }

    return ThemeData(
      brightness: Brightness.dark,
      accentColor: AppColors.darkAccentColor,
      primaryColor: AppColors.darkPrimaryColor,
    );
  }
}
