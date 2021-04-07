part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(Email.pure()) final Email email,
    @Default(Password.pure()) final Password password,
    @Default(FormzStatus.valid) final FormzStatus status,
  }) = _Initial;

  const factory LoginState.validating({
    required final Email email,
    required final Password password,
    required final FormzStatus status,
  }) = _Validating;
}
