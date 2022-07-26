import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:magangjogja/bloc/absensi_cubit.dart';
import 'package:magangjogja/bloc/kegiatan_guru_cubit.dart';
import 'package:magangjogja/cubit/auth/auth_cubit.dart';
import 'package:magangjogja/cubit/user/user_cubit.dart';
import 'package:magangjogja/pages/pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider<KegiatanGuruCubit>(
            create: (context) => KegiatanGuruCubit()..getKegiatanGuru),
        BlocProvider<AbsensiCubit>(
            create: (context) => AbsensiCubit()..getListAnak),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
