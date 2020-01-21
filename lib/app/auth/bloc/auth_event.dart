import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Auth event.
@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent([List<dynamic> props = const <dynamic>[]]) : super();
}

/// LoginButtonPressed event.
class LoginButtonPressed extends AuthEvent {
  LoginButtonPressed({
    @required this.email,
    @required this.password,
  }) : super(<String>[email, password]);

  final String email;
  final String password;

  @override
  String toString() => 'LoginButtonPressed { email/phone: $email }';

  @override
  List<Object> get props => [email, password];
}

/// CleanRegistrationEvent event.
class CleanRegistrationEvent extends AuthEvent {
  @override
  String toString() => 'CleanRegistrationEvent {}';

  @override
  List<Object> get props => null;
}

/// LoginFacebookButtonPressed event.
class LoginFacebookButtonPressed extends AuthEvent {
  @override
  String toString() => 'LoginFacebookButtonPressed { }';

  @override
  List<Object> get props => null;
}
