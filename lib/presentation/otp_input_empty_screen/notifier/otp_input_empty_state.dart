// ignore_for_file: must_be_immutable

part of 'otp_input_empty_notifier.dart';

/// Represents the state of OtpInputEmpty in the application.
class OtpInputEmptyState extends Equatable {
  OtpInputEmptyState({
    this.otpController,
    this.otpInputEmptyModelObj,
  });

  TextEditingController? otpController;

  OtpInputEmptyModel? otpInputEmptyModelObj;

  @override
  List<Object?> get props => [
        otpController,
        otpInputEmptyModelObj,
      ];

  OtpInputEmptyState copyWith({
    TextEditingController? otpController,
    OtpInputEmptyModel? otpInputEmptyModelObj,
  }) {
    return OtpInputEmptyState(
      otpController: otpController ?? this.otpController,
      otpInputEmptyModelObj:
          otpInputEmptyModelObj ?? this.otpInputEmptyModelObj,
    );
  }
}
