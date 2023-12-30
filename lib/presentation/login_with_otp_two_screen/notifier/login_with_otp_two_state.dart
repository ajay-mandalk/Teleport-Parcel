// ignore_for_file: must_be_immutable

part of 'login_with_otp_two_notifier.dart';

/// Represents the state of LoginWithOtpTwo in the application.
class LoginWithOtpTwoState extends Equatable {
  LoginWithOtpTwoState({
    this.otpController,
    this.loginWithOtpTwoModelObj,
  });

  TextEditingController? otpController;

  LoginWithOtpTwoModel? loginWithOtpTwoModelObj;

  @override
  List<Object?> get props => [
        otpController,
        loginWithOtpTwoModelObj,
      ];

  LoginWithOtpTwoState copyWith({
    TextEditingController? otpController,
    LoginWithOtpTwoModel? loginWithOtpTwoModelObj,
  }) {
    return LoginWithOtpTwoState(
      otpController: otpController ?? this.otpController,
      loginWithOtpTwoModelObj:
          loginWithOtpTwoModelObj ?? this.loginWithOtpTwoModelObj,
    );
  }
}
