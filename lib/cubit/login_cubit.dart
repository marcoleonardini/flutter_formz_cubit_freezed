import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_cubit_freezed/validator/validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void passwordChangedEvent({required String password}) {
    print('passwordChangedEvent');
    print(password.length);
    print(password);
    final _pass = Password.dirty(password);
    final newS = state.copyWith(
      status: Formz.validate([state.email, _pass]),
      password: _pass,
      email: state.email,
    );
    emit(newS);
  }

  void emailChangedEvent({required String email}) {
    final _email = Email.dirty(email);
    print('emailChangedEvent');
    print(_email.value);
    print(_email.value.length);
    print(state.email);
    print('********************');

    final newS = state.copyWith(
      status: Formz.validate([_email, state.password]),
      password: state.password,
      email: _email,
    );
    emit(newS);
  }
}
