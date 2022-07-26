part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoaded extends UserState {
  final DetailUserModel detailUserModel;
  const UserLoaded({
    required this.detailUserModel,
  });
  @override
  List<Object?> get props => [detailUserModel];
}

class UserPendaftaran extends UserState {
  @override
  List<Object?> get props => [];
}

class UserError extends UserState {
  @override
  List<Object?> get props => [];
}
