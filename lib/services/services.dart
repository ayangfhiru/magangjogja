import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as http_dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:magangjogja/models/absensi.dart';
import 'package:magangjogja/models/detail_user.dart';
import 'package:magangjogja/models/kegiatan.dart';
import 'package:magangjogja/models/user.dart';

part 'dio.dart';
part 'user_services.dart';
part 'absensi_services.dart';
part 'auth_services.dart';
part 'kegiatan_services.dart';
part 'status_services.dart';

String baseUrl = 'http://10.0.2.2:8000/api';
