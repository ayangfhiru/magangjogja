import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magangjogja/models/kegiatan.dart';
import 'package:magangjogja/services/services.dart';

class KegiatanGuruCubit extends Cubit<List<KegiatanGuruModel>> {
  KegiatanGuruCubit() : super([]);

  void get getKegiatanGuru async =>
      emit(await KegiatanServices().getListCatatan());
}
