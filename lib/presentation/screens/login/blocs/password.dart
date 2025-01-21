import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<String> {
  PasswordCubit() : super('');
  
  void setPassword(String password) {
    emit(password);
  }
}
