part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String phoneNumber;
  final bool isInitial;
  final bool isTermAndConditionChecked;
  final String phoneNumberSubmittingStatus;
  final FormSubmissionStatus phoneNumberSubmitionStatus;
  bool get isValidPhoneNumber {
    const String pattern = r'^(?:[0][8])[0-9]{7,11}$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }

  //-----------------------SigninPin Data----------------------------------//

  final String pinNumber;
  final String isValidPassword;
  bool get pinFormValidator => pinNumber.length == 6;
  bool get isSuspended => failedSubmittingPin == 3;
  final FormSubmissionStatus formStatus;
  final int failedSubmittingPin;
  final int suspendTimer;
  SignInState({
    required this.phoneNumber,
    required this.isInitial,
    required this.isTermAndConditionChecked,
    required this.phoneNumberSubmittingStatus,
    required this.pinNumber,
    required this.isValidPassword,
    required this.failedSubmittingPin,
    required this.formStatus,
    required this.phoneNumberSubmitionStatus,
    required this.suspendTimer,
  });

  SignInState copyWith({
    String? phoneNumber,
    String? pinNumber,
    FormSubmissionStatus? formStatus,
    FormSubmissionStatus? phoneNumberSubmitionStatus,
    bool? isInitial,
    bool? isTermAndConditionChecked,
    String? phoneNumberSubmittingStatus,
    String? isValidPassword,
    int? failedSubmittingPin,
    int? suspendTimer,
  }) {
    return SignInState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pinNumber: pinNumber ?? this.pinNumber,
      formStatus: formStatus ?? this.formStatus,
      isInitial: isInitial ?? this.isInitial,
      phoneNumberSubmitionStatus:
          phoneNumberSubmitionStatus ?? this.phoneNumberSubmitionStatus,
      phoneNumberSubmittingStatus:
          phoneNumberSubmittingStatus ?? this.phoneNumberSubmittingStatus,
      isTermAndConditionChecked:
          isTermAndConditionChecked ?? this.isTermAndConditionChecked,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      failedSubmittingPin: failedSubmittingPin ?? this.failedSubmittingPin,
      suspendTimer: suspendTimer ?? this.suspendTimer,
    );
  }

  @override
  List<Object> get props => [
        phoneNumber,
        pinNumber,
        formStatus,
        isInitial,
        isTermAndConditionChecked,
        phoneNumberSubmitionStatus,
        phoneNumberSubmittingStatus,
        isValidPassword,
        failedSubmittingPin,
        suspendTimer,
      ];
}
