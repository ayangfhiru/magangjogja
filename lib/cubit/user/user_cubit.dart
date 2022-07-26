import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magangjogja/models/detail_user.dart';
import 'package:magangjogja/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    getDetailUser();
  }

  Future<DetailUserModel?> getDetailUser() async {
    emit(UserLoading());
    var response = await UserServices().getDetailUser();

    if (response == null) {
      emit(UserPendaftaran());
    } else {}
    return null;
  }
}
