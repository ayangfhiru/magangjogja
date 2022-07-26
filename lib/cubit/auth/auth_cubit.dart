import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:magangjogja/models/user.dart';
import 'package:magangjogja/services/services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late UserModel? user;
  AuthCubit() : super(AuthInitial()) {
    checkToken();
  }

  Future login({required Map creds}) async {
    emit(AuthLoading());
    String result = await AuthServices().login(creds: creds);
    AuthServices().tryToken(token: result);
    checkToken();
  }

  Future<void> register({required Map creds}) async {
    emit(AuthLoading());
    emit(AuthVerification());
    user = await AuthServices().register(creds: creds);
    // List<UserModel?> userResult = {user}.toList(growable: true);
    Future.delayed(const Duration(seconds: 3), () {
      emit(AuthVerification());
    });
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await AuthServices().deleteToken();
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(AuthLoading());
      if (result == true) {
        checkToken();
        emit(AuthInitial());
      }
    });
  }

  Future<void> checkToken() async {
    final token = await AuthServices().checkToken();
    debugPrint(token);
    emit(AuthLoading());
    if (token != null) {
      emit(AuthWelcome());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> emailVerification(token) async {
    emit(AuthLoading());
    final verification = await AuthServices().emailVerification(token: token);
    Future.delayed(const Duration(microseconds: 500), () {
      if (verification) {
        emit(AuthWelcome());
      } else {
        emit(AuthInitial());
      }
    });
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint('currentState ${change.currentState}');
    debugPrint('nextState ${change.nextState}');
  }
}
