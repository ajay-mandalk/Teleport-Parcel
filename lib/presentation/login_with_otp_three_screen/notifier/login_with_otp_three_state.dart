// ignore_for_file: must_be_immutable

part of 'login_with_otp_three_notifier.dart';

/// Represents the state of LoginWithOtpThree in the application.
class LoginWithOtpThreeState extends Equatable {
  LoginWithOtpThreeState({this.loginWithOtpThreeModelObj});

  LoginWithOtpThreeModel? loginWithOtpThreeModelObj;

  @override
  List<Object?> get props => [
        loginWithOtpThreeModelObj,
      ];

  LoginWithOtpThreeState copyWith(
      {LoginWithOtpThreeModel? loginWithOtpThreeModelObj}) {
    return LoginWithOtpThreeState(
      loginWithOtpThreeModelObj:
          loginWithOtpThreeModelObj ?? this.loginWithOtpThreeModelObj,
    );
  }
}
