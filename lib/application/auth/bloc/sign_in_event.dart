part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SigninPhoneNumberFormChanged extends SignInEvent {
  final String? phoneNumber;

  SigninPhoneNumberFormChanged({this.phoneNumber});
}

class SignInPinFormChanged extends SignInEvent {
  final String? pin;

  SignInPinFormChanged({this.pin});
}

class SignInPhoneNumberSubmitted extends SignInEvent {}

class SignInPinSubmitted extends SignInEvent {
  final String phoneNumber;
  final String pinNumber;

  SignInPinSubmitted({
    required this.phoneNumber,
    required this.pinNumber,
  });
}

class SuspendedTimer extends SignInEvent {
  final int suspendedTimer;
  SuspendedTimer({
    required this.suspendedTimer,
  });
}

class CleanCache extends SignInEvent {}

class TermAndConditionCheckBoxPressed extends SignInEvent {}
