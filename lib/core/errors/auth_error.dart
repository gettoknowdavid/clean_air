import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_error.freezed.dart';

@freezed
class AuthError with _$AuthError {
  const factory AuthError.emailInUse() = _EmailInUse;
  const factory AuthError.invalidEmail() = _InvalidEmail;
  const factory AuthError.invalidEmailOrPassword() = _InvalidEmailOrPassword;
  const factory AuthError.noGoogleAccount() = _NoGoogleAccount;
  const factory AuthError.notVerified() = _NotVerified;
  const factory AuthError.serverError() = _ServerError;
  const factory AuthError.userNotFound() = _UserNotFound;
  const factory AuthError.noNetworkConnection() = _NoNetworkConnection;
}
