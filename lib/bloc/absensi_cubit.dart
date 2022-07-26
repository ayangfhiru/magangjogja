import 'package:bloc/bloc.dart';
import 'package:magangjogja/models/absensi.dart';
import 'package:magangjogja/services/services.dart';

class AbsensiCubit extends Cubit<List<ListAbsensiModel>> {
  AbsensiCubit() : super([]);

  void get getListAnak async => emit(await AbsensiServices().getListAnak());
}
