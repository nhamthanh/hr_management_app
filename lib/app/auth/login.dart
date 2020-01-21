

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hr_management_app/app/common/base_state.dart';
import 'package:hr_management_app/app/common/text_styles.dart';
import 'package:hr_management_app/app/widget/button/facebook_button.dart';
import 'package:hr_management_app/app/widget/button/primary_button.dart';
import 'package:hr_management_app/app/widget/text/edit_text_field.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'service/auth_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends BaseState<Login> {

  bool _validEmail;
  bool _validPassword;
  AuthBloc _authBloc;

  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this, length: _tabs.length);

    final AuthService authService = AuthService(apiProvider);
    // final MembershipService membershipService = MembershipService(apiProvider);
    // final NotificationService notificationService = NotificationService(apiProvider);
    _authBloc = AuthBloc(authService: authService);
  }

  void _handleLoginClick() {
    _authBloc.add(LoginButtonPressed(email: emailPhoneController.text, password: passwordController.text));
  }


  void _onLoginFacebookButtonPressed() {
    _authBloc.add(LoginFacebookButtonPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 28.0, right: 27.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 25),
                      Row(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Expanded(
                            child: EditTextField(
                              hasLabel: false,
                              title: 'login.email_phone',
                              hint: 'login.email_phone_hint',
                              error: _validEmail ? null : 'login.email_phone_is_required',
                              onTextChanged: (String value) => setState(() => _validEmail = value.isNotEmpty),
                              controller: emailPhoneController,
                            )
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: EditTextField(
                              hasLabel: false,
                              title: 'login.password',
                              hint: 'login.password_hint',
                              error: _validPassword ? null : 'login.password_is_required',
                              obscureText: true,
                              onTextChanged: (String value) => setState(() => _validPassword = value.isNotEmpty),
                              controller: passwordController,
                            )
                          ),
                        ],
                      ),
                      const SizedBox(height: 28.5),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: PrimaryButton(
                                text: 'login.login',
                                onPressed: _handleLoginClick,
                              )
                            ),
                          ),
                        ]
                      ),
                      // const SizedBox(height: 10.0),
                      // Material(
                      //   color: Colors.white,
                      //   child: InkWell(
                      //     highlightColor: Colors.white,
                      //     focusColor: Colors.white,
                      //     splashColor: Colors.white,
                      //     onTap: () {
                      //       _onForgetPasswordPress();
                      //     },
                      //     child: Container(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Text(
                      //         'login.forgot_password',
                      //         style: TextStyles.textStyle11PrimaryBlueBold,
                      //       ),
                      //     )
                      //   ),
                      // ),
                      const SizedBox(height: 7),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              thickness: 1.0,
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          Center(
                            child: const Text('Hoặc',
                              style: TextStyles.textStyle11PrimaryBlack,
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          const Expanded(
                            child: Divider(
                              thickness: 1.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FacebookButton(
                              text: 'login.login_with_facebook',
                              onPressed: _onLoginFacebookButtonPressed,
                            )
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ]
          )
        ),
      )]
    );
  }

}