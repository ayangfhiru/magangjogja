import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:magangjogja/bloc/kegiatan_guru_cubit.dart';
import 'package:magangjogja/models/absensi.dart';
import 'package:magangjogja/models/kegiatan.dart';
import 'package:magangjogja/pages/pages.dart';
import 'package:magangjogja/services/services.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:supercharged/supercharged.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;

part 'guru_kegiatan.dart';
part 'guru_absensi.dart';
