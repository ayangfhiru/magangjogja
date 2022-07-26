import 'dart:io';
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:magangjogja/cubit/auth/auth_cubit.dart';
import 'package:magangjogja/cubit/user/user_cubit.dart';
import 'package:magangjogja/models/absensi.dart';
import 'package:magangjogja/models/user.dart';
import 'package:magangjogja/pages/auth/auth.dart';
import 'package:magangjogja/pages/user/user.dart';
import 'package:magangjogja/pages/widgets/widgets.dart';
import 'package:magangjogja/services/services.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

part 'main_page.dart';
part 'status_page.dart';
part 'beranda_page.dart';
part 'welcome_page.dart';
part 'general_page.dart';
part 'pendaftaran_page.dart';
