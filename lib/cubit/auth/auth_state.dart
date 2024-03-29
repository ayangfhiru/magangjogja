part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AtuhLoaded extends AuthState {}

class AuthError extends AuthState {}

class AuthVerification extends AuthState {}

class AuthWelcome extends AuthState {}
