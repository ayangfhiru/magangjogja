part of 'pages.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  late List<Widget> children;
  bool _isButtonDisabled = true;

  // query SELECT absens.user_id, (pulang - izinMasuk), (izinKeluar - istirahatMasuk), (istirahatKeluar - masuk) FROM absens

  // get location
  late String? location;
  bool loading = true;

  // timer
  late String day = DateFormat.yMMMEd().format(DateTime.now());
  final storage = const FlutterSecureStorage();
  late final String? token;
  late int currentIndex = 0;
  late String btnClick = 'button_1';
  late String textTitle;
  bool title = false;
  late String statusAbsen = 'masuk';
  String? masuk, istirahat, isitimasuk, izin, pulang;

  @override
  void initState() {
    super.initState();
  }

  // void readToken() async {
  //   token = await storage.read(key: 'token');
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 95),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 105),
                      child: Column(children: [
                        Text("Absensi",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: StreamBuilder(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Center(
                                child: Text(
                                  DateFormat.Hm().format(DateTime.now()),
                                  style: GoogleFonts.roboto(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(day,
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w300)),
                        Container(
                          margin: const EdgeInsets.all(15),
                          height: 220,
                          width: 220,
                          child: TextButton(
                            onPressed: (_isButtonDisabled)
                                ? () {}
                                : () {
                                    setState(() {
                                      Map time = {
                                        'lokasi': location,
                                        'time': DateTime.now()
                                            .millisecondsSinceEpoch,
                                        'status': statusAbsen
                                      };
                                      AbsensiServices().postAbsensi(time: time);
                                    });
                                    AbsensiServices().getAbsensi();
                                  },
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(180))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage((btnClick != 'button_1')
                                          ? 'images/$btnClick.png'
                                          : 'images/button_1.png'))),
                              child: Align(
                                alignment: const Alignment(-0.15, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 15),
                                      height: 110,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/touch.png'))),
                                    ),
                                    Text(
                                      (title) ? textTitle : 'Masuk',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // location
                        LocationWidget(
                          locationCallback: (Map<String, dynamic> data) {
                            location = data['location'];
                            setState(() {
                              if (location != null) {
                                _isButtonDisabled = false;
                              }
                            });
                          },
                        ),
                        // times widget
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          height: 90,
                          width: double.infinity,
                          child: FutureBuilder<AbsensiModel?>(
                              future: AbsensiServices().getAbsensi(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: "C6EED8".toColor(),
                                    ),
                                  );
                                } else {
                                  if (snapshot.hasData) {
                                    var data = snapshot.data;

                                    if (data?.istirahatMasuk != null) {
                                      if (data?.masuk != null) {
                                        debugPrint('pulang');
                                        izin = DateFormat.Hm()
                                            .format(DateTime.now());
                                        btnClick = 'button_1';
                                        statusAbsen = 'pulang';
                                        title = true;
                                        textTitle = 'Pulang';
                                        AbsensiServices().getAbsensi();
                                      } else if (data?.izinMasuk != null) {
                                        debugPrint('izinMasuk');
                                        izin = DateFormat.Hm()
                                            .format(DateTime.now());
                                        btnClick = 'button_1';
                                        statusAbsen = 'pulang';
                                        title = true;
                                        textTitle = 'Pulang';
                                        AbsensiServices().getAbsensi();
                                      } else if (data?.izinKeluar != null) {
                                        debugPrint('izinKeluar');
                                        izin = DateFormat.Hm()
                                            .format(DateTime.now());
                                        btnClick = 'button_3';
                                        statusAbsen = 'izin_masuk';
                                        title = true;
                                        textTitle = 'Izin masuk';
                                        AbsensiServices().getAbsensi();
                                      } else {
                                        debugPrint('istirahatMasuk');
                                        istirahat = DateFormat.Hm()
                                            .format(DateTime.now());
                                        btnClick = 'button_3';
                                        statusAbsen = 'izin_keluar';
                                        title = true;
                                        textTitle = 'Izin\nKeluar';
                                        AbsensiServices().getAbsensi();
                                      }
                                    } else if (data?.istirahatKeluar != null) {
                                      debugPrint('istirahatKeluar');
                                      istirahat = DateFormat.Hm()
                                          .format(DateTime.now());
                                      btnClick = 'button_2';
                                      statusAbsen = 'istirahat_masuk';
                                      title = true;
                                      textTitle = 'Istirahat\nMasuk';
                                      AbsensiServices().getAbsensi();
                                    } else if (data?.masuk != null) {
                                      debugPrint('masuk');
                                      masuk = DateFormat.Hm()
                                          .format(DateTime.now());
                                      btnClick = 'button_2';
                                      statusAbsen = 'istirahat_keluar';
                                      title = true;
                                      textTitle = 'Istirahat\nKeluar';
                                      AbsensiServices().getAbsensi();
                                    }

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/beranda_masuk.png'))),
                                            ),
                                            Text((snapshot.data!.masuk != null)
                                                ? DateFormat('kk:mm').format(
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            snapshot.data!
                                                                    .masuk ??
                                                                0))
                                                : '-'),
                                            Text(
                                              "Masuk",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/beranda_istirahat.png'))),
                                            ),
                                            Text((snapshot.data!
                                                        .istirahatKeluar !=
                                                    null)
                                                ? DateFormat('kk:mm').format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        snapshot.data!
                                                                .istirahatKeluar ??
                                                            0))
                                                : '-'),
                                            Text(
                                              "Istirahat",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/beranda_izin.png'))),
                                            ),
                                            Text((snapshot.data!.izinKeluar !=
                                                    null)
                                                ? DateFormat('kk:mm').format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        snapshot.data!
                                                                .izinKeluar ??
                                                            0))
                                                : '-'),
                                            Text(
                                              "Izin Keluar",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/beranda_pulang.png'))),
                                            ),
                                            Text((snapshot.data!.pulang != null)
                                                ? DateFormat('kk:mm').format(
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            snapshot.data!
                                                                    .pulang ??
                                                                0))
                                                : '-'),
                                            Text(
                                              "Pulang",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  } else {
                                    return const BelumAbsen();
                                  }
                                }
                              }),
                        )
                      ]),
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0.95, -0.35),
              child: TextButton(
                onPressed: () {
                  debugPrint("Add Project");
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/add_project.png'))),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class BelumAbsen extends StatelessWidget {
  const BelumAbsen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/beranda_masuk.png'))),
            ),
            const Text('-'),
            Text(
              "Masuk",
              style:
                  GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/beranda_istirahat.png'))),
            ),
            const Text('-'),
            Text(
              "Istirahat",
              style:
                  GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/beranda_izin.png'))),
            ),
            const Text('-'),
            Text(
              "Izin Keluar",
              style:
                  GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/beranda_pulang.png'))),
            ),
            const Text('-'),
            Text(
              "Pulang",
              style:
                  GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    );
  }
}
