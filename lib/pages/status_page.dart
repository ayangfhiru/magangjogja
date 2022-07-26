part of 'pages.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(bottom: 100),
          children: [
            FutureBuilder<UserForStatus?>(
              future: StatusServices().getUserForStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 199,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.green)),
                  );
                } else {
                  if (snapshot.hasData) {
                    debugPrint(snapshot.data!.namaLengkap);
                    return Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // status profile
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 75,
                                    backgroundImage: CachedNetworkImageProvider(
                                        (snapshot.data!.avatar == null)
                                            ? "http://10.0.2.2:8000/storage/avatar/default_avatar.png"
                                            : "http://10.0.2.2:8000/storage/avatar/${snapshot.data!.avatar}"),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Bergabung",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                          DateFormat.yMMMd().format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  snapshot.data!.tglGabung)),
                                          style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        height: 50,
                                        width: 120,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            debugPrint("Add Saldo");
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      "FFE064".toColor()),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Saldoku",
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15)),
                                              Text("Rp 500.000",
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(left: 50, top: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 125,
                                child: Text(
                                  snapshot.data!.namaLengkap,
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  }
                }
              },
            ),
            // build
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // status body
                  Column(
                    children: [
                      //Bagian
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/status_bagian.png'))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bagian",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    FutureBuilder<UserForStatus?>(
                                        future:
                                            StatusServices().getUserForStatus(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Text('-');
                                          } else {
                                            if (snapshot.hasData) {
                                              return Text(
                                                snapshot.data!.programMagang,
                                                overflow: TextOverflow.clip,
                                                maxLines: 2,
                                                style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              );
                                            } else {
                                              return Text(
                                                "Gagal mendapatkan bagian magang",
                                                overflow: TextOverflow.clip,
                                                maxLines: 2,
                                                style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              );
                                            }
                                          }
                                        }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Durasi
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/status_durasi.png'))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Durasi",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "3 Bulan",
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Waktu yang tersisa
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/status_waktu.png'))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Waktu yang tersisa",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "2 Bulan 7 Hari",
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Catering
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/status_catering.png'))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Catering",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Mau makan tepat waktu? sini kami bantu",
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Kosan
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/status_kosan.png'))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kosan",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Bingung cari kosan? sini kami bantu",
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Laundry
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          onPressed: () {
                            // Get.to(() => const BerandaLaundry());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/status_laundry.png'))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 25),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Laundry",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Gaada waktu buat nyuci? sini kami bantu",
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 40,
                    width: 100,
                    child: TextButton(
                      onPressed: () {
                        // logout;
                        Provider.of<AuthCubit>(context, listen: false).logout();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              "C6EED8".toColor()),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/status_logout.png'))),
                          ),
                          Text("Keluar",
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
