part of 'pages.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({Key? key}) : super(key: key);

  @override
  State<PendaftaranPage> createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  int page = 1;
  final _formKey = GlobalKey<FormState>();

  //page 1
  late String _kelamin = "";
  late String _jenisMagang = "";
  late String _sistemMagang = "";
  late String _statusAnda = "";
  final TextEditingController _namaLengkap = TextEditingController();
  final TextEditingController _nomorNik = TextEditingController();
  final TextEditingController _nomorWhatsApp = TextEditingController();
  final TextEditingController _asalSekolah = TextEditingController();
  final TextEditingController _programStudi = TextEditingController();
  final TextEditingController _kotaAsal = TextEditingController();
  final TextEditingController _alasanMagang = TextEditingController();

  //page 2
  final _magang = {
    "UI/UX":
        "Alasan memilih program magang di Disain Grafis atau UI/UX Designer, software design apa saja yang Anda kuasai ?",
    "Programmer (front end/backend)":
        "Alasan memilih program magang Programmer, Bahasa Pemrograman apa saja yang sudah Anda kuasai?",
    "Videographer":
        "Alasan memilih program magang Videografer, software editing video yang Anda kuasai apa saja?",
    "Digital marketing":
        "Alasan memilih program magang Digital Marketing, materi mana yang anda ingin praktikan?"
  };
  late String _alasan = "";
  bool _addForm = false;
  bool _digitalMarketing = false;

  late String _bahasaInggris = "";
  late String _jamMagang = "";
  late String _programMagang = "R & D (Research and Development)";
  late String _laptop = "";
  late String _alatDimiliki = "";
  late String _infoMagang = "";
  late String _materiDigiMarket = "";

  final TextEditingController _whatsappPembimbing = TextEditingController();
  final TextEditingController _penguasaanSkil = TextEditingController();
  final TextEditingController _mulaiMagang = TextEditingController();

  //page 3
  late String _motor = "";
  String? fileNameCv;
  String? fileNamePortofolio;
  String? nameCv;
  String? namePorto;

  @override
  void initState() {
    _penguasaanSkil.text = '-';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 53, right: 53),
          padding: const EdgeInsets.only(bottom: 90),
          child: (page == 1)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Get.back();
                              },
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.only(top: 50),
                              child: Text('Pendaftaran',
                                  style: GoogleFonts.roboto(fontSize: 25)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 30),
                          child: const Text('Nama Lengkap'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _namaLengkap,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter valid Email'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('NIK (Nomor Induk Kependudukan)'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _nomorNik,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter valid Email'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Jenis Kelamin'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "Laki-laki",
                                          groupValue: _kelamin,
                                          onChanged: (value) {
                                            setState(() {
                                              _kelamin = value.toString();
                                            });
                                          },
                                        ),
                                        const Expanded(child: Text("Laki-laki"))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "Perempuan",
                                          groupValue: _kelamin,
                                          onChanged: (value) {
                                            setState(() {
                                              _kelamin = value.toString();
                                            });
                                          },
                                        ),
                                        const Expanded(child: Text("Perempuan"))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                              'No. HP Aktif yang bisa dihubungi dan chat WA :'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _nomorWhatsApp,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter No WhatsApp'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Asal Sekolah / Kampus'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _asalSekolah,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter asal sekolah'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Program Studi'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _programStudi,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter program studi'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                              'Nama Kota/Daerah tempat tinggal Anda saat ini'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _kotaAsal,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter tempat tinggal'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                              'Mengapa Anda ingin Magang / PKL disini'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 340,
                          decoration: BoxDecoration(
                              color: "E1E1E1".toColor(),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _alasanMagang,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter alasan magang'
                                : null,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Jenis Magang apa yang Anda pilih'),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text(
                                    "Magang Mandiri (magang atas inisatif diri sendiri, bukan kewajiban dari kampus)"),
                                leading: Radio(
                                    value: "magang mandiri",
                                    groupValue: _jenisMagang,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _jenisMagang = value.toString();
                                        },
                                      );
                                    }),
                              ),
                              ListTile(
                                title: const Text(
                                    "Magang Mandiri (magang atas inisatif diri sendiri, bukan kewajiban dari kampus)"),
                                leading: Radio(
                                    value: "magang sekolah",
                                    groupValue: _jenisMagang,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _jenisMagang = value.toString();
                                        },
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Sistem Magang'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text("WFO (Work From Office)"),
                                leading: Radio(
                                    value: "WFO",
                                    groupValue: _sistemMagang,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _sistemMagang = value.toString();
                                        },
                                      );
                                    }),
                              ),
                              ListTile(
                                title: const Text("WFH (Work From Home)"),
                                leading: Radio(
                                    value: "WFH",
                                    groupValue: _sistemMagang,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _sistemMagang = value.toString();
                                        },
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Status Anda saat ini'),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text(
                                      "Masih sekolah / Masih kuliah"),
                                  leading: Radio(
                                      value: "masih sekolah",
                                      groupValue: _statusAnda,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _statusAnda = value.toString();
                                          },
                                        );
                                      }),
                                ),
                                ListTile(
                                  title: const Text(
                                      "Sudah lulus sekolah/Kuliah dan belum bekerja"),
                                  leading: Radio(
                                      value: "lulus belum kerja",
                                      groupValue: _statusAnda,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _statusAnda = value.toString();
                                          },
                                        );
                                      }),
                                ),
                                ListTile(
                                  title: const Text(
                                      "Sudah lulus dan sedang bekerja"),
                                  leading: Radio(
                                      value: "lulus sudah bekerja",
                                      groupValue: _statusAnda,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _statusAnda = value.toString();
                                          },
                                        );
                                      }),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              page = 2;
                            },
                          );
                        },
                        child: Image.asset('images/pendaftaran_next.png'),
                      ),
                    ),
                  ],
                )
              // body page 2
              : (page == 2)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 50),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    setState(() {
                                      page = 1;
                                    });
                                  },
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  margin: const EdgeInsets.only(top: 50),
                                  child: Text('Pendaftaran',
                                      style: GoogleFonts.roboto(fontSize: 25)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                  'Anda bisa baca buku berbahasa Inggris kah?'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text("Saya bisa"),
                                    leading: Radio(
                                        value: "saya bisa",
                                        groupValue: _bahasaInggris,
                                        onChanged: (value) {
                                          setState(() {
                                            _bahasaInggris = value.toString();
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Saya kurang bisa"),
                                    leading: Radio(
                                        value: "kurang bisa",
                                        groupValue: _bahasaInggris,
                                        onChanged: (value) {
                                          setState(() {
                                            _bahasaInggris = value.toString();
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Saya tidak bisa"),
                                    leading: Radio(
                                        value: "tidak bisa",
                                        groupValue: _bahasaInggris,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _bahasaInggris = value.toString();
                                            },
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'No. HP Aktif / WA Dosen atau Guru Pembimbing PKL/Magang beserta Nama dan Jabatan'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 340,
                              decoration: BoxDecoration(
                                  color: "E1E1E1".toColor(),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: _whatsappPembimbing,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter Whatsapp pembimbing'
                                    : null,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'Program Magang/PKL apa yang Anda minati'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  color: "E1E1E1".toColor(),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  DropdownButton<String>(
                                    hint: const Text("Pilih Program Magang"),
                                    value: _programMagang,
                                    items: _dropDownItem(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _programMagang = value.toString();
                                          _addForm = false;
                                          _digitalMarketing = false;
                                          _alasan = "";
                                          _magang.forEach((key, value) {
                                            if (_programMagang == key) {
                                              _addForm = true;
                                              _alasan = value;
                                            }
                                            if (_programMagang ==
                                                "Digital marketing") {
                                              _addForm = true;
                                              _digitalMarketing = true;
                                              _alasan = value;
                                            }
                                          });
                                        },
                                      );
                                    },
                                    underline: Container(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'Silakan pilih jam kerja magang yang Anda sanggupi'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text("09:00 - 17:00"),
                                    leading: Radio(
                                        value: "09:00 - 17:00",
                                        groupValue: _jamMagang,
                                        onChanged: (value) {
                                          setState(() {
                                            _jamMagang = value.toString();
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("13:00 - 21:00"),
                                    leading: Radio(
                                        value: "13:00 - 21:00",
                                        groupValue: _jamMagang,
                                        onChanged: (value) {
                                          setState(() {
                                            _jamMagang = value.toString();
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        _addForm
                            ? _digitalMarketing
                                ? Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.only(top: 15),
                                        child: Text(_alasan),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: const Text(
                                                  "Digital marketing organic. Nb : Free tanpa dana untuk beriklan"),
                                              leading: Radio(
                                                  value:
                                                      "Digital marketing organic",
                                                  groupValue: _materiDigiMarket,
                                                  onChanged: (value) {
                                                    setState(
                                                      () {
                                                        _materiDigiMarket =
                                                            value.toString();
                                                      },
                                                    );
                                                  }),
                                            ),
                                            ListTile(
                                              title: const Text(
                                                  "Digital marketing Ads (FB Ads / Ig Ads). Nb : harus menyiapkan dana untuk belajar beriklan dengan Ads min. 30K/day selama iklan berjalan."),
                                              leading: Radio(
                                                  value:
                                                      "Digital marketing Ads",
                                                  groupValue: _materiDigiMarket,
                                                  onChanged: (value) {
                                                    setState(
                                                      () {
                                                        _materiDigiMarket =
                                                            value.toString();
                                                      },
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.only(top: 15),
                                        child: Text(_alasan),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: 340,
                                        decoration: BoxDecoration(
                                            color: "E1E1E1".toColor(),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: TextField(
                                          maxLines: null,
                                          controller: _penguasaanSkil,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  )
                            : Container(),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'Apakah Anda ada alat kerja sendiri (LAPTOP) yang bisa dipakai selama Magang/PKL'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text("Ada"),
                                    leading: Radio(
                                        value: "ada",
                                        groupValue: _laptop,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _laptop = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Tidak Ada"),
                                    leading: Radio(
                                        value: "tidak ada",
                                        groupValue: _laptop,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _laptop = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'Jika YA, alat apa yang Anda miliki, yang bisa Anda bawa selama Magang/PKL'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text(
                                        "Laptop yang sudah terinstal corel dan photoshop"),
                                    leading: Radio(
                                        value: "corel dan photoshop",
                                        groupValue: _alatDimiliki,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _alatDimiliki = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text(
                                        "laptop yang sudah terinstal adobe premier pro/final cut pro/adobe after effect"),
                                    leading: Radio(
                                        value: "adobe",
                                        groupValue: _alatDimiliki,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _alatDimiliki = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Kamera DSLR"),
                                    leading: Radio(
                                        value: "dslr",
                                        groupValue: _alatDimiliki,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _alatDimiliki = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Laptop / notebook"),
                                    leading: Radio(
                                        value: "laptop",
                                        groupValue: _alatDimiliki,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _alatDimiliki = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'Kapan Anda berencana mulai Magang/PKL? (tulis lengkap tanggal, bulan, tahun)'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 340,
                                decoration: BoxDecoration(
                                    color: "E1E1E1".toColor(),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  controller: _mulaiMagang,
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter valid Email'
                                      : null,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                  'Anda tahu info magang ini darimana?'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text("Website"),
                                    leading: Radio(
                                      value: "Website",
                                      groupValue: _infoMagang,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _infoMagang = value.toString();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text("Instagram"),
                                    leading: Radio(
                                        value: "Instagram",
                                        groupValue: _infoMagang,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _infoMagang = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Twitter"),
                                    leading: Radio(
                                        value: "Twitter",
                                        groupValue: _infoMagang,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _infoMagang = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Glints"),
                                    leading: Radio(
                                        value: "Glints",
                                        groupValue: _infoMagang,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _infoMagang = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                  ListTile(
                                    title: const Text("Youtube"),
                                    leading: Radio(
                                        value: "Youtube",
                                        groupValue: _infoMagang,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _infoMagang = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 50,
                          width: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                page = 3;
                              });
                            },
                            child: Image.asset('images/pendaftaran_next.png'),
                          ),
                        ),
                      ],
                    )
                  // body page 3
                  : (page == 3)
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 50),
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        setState(() {
                                          page = 2;
                                        });
                                      },
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: Text('Pendaftaran',
                                      style: GoogleFonts.roboto(fontSize: 25)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(top: 30),
                                  child:
                                      const Text('Apakah anda membawa motor?'),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: const Text("Iya"),
                                        leading: Radio(
                                            value: "Iya",
                                            groupValue: _motor,
                                            onChanged: (value) {
                                              setState(() {
                                                _motor = value.toString();
                                              });
                                            }),
                                      ),
                                      ListTile(
                                        title: const Text("Tidak"),
                                        leading: Radio(
                                            value: "Tidak",
                                            groupValue: _motor,
                                            onChanged: (value) {
                                              setState(() {
                                                _motor = value.toString();
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(top: 30),
                                  child: const Text(
                                      'Silakan upload : CV, Scan KTP/KTM, dan Surat Pengantar dr kampus disini. Format pdf.'),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 45,
                                  width: 340,
                                  decoration: BoxDecoration(
                                    color: "E1E1E1".toColor(),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextButton(
                                      onPressed: () async {
                                        FilePickerResult? resCv =
                                            await FilePicker.platform.pickFiles(
                                                type: FileType.custom,
                                                allowedExtensions: ['pdf']);
                                        if (resCv != null) {
                                          PlatformFile cvFile =
                                              resCv.files.first;
                                          setState(() {
                                            String name = cvFile.name;
                                            nameCv = name;
                                            var fileCv = File(resCv
                                                .files.first.path
                                                .toString());
                                            int date = DateTime.now()
                                                .millisecondsSinceEpoch;
                                            fileNameCv = date.toString() + name;
                                            UserServices()
                                                .uploadCv(fileCv, fileNameCv);
                                          });
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.file_present_rounded),
                                          (nameCv == null)
                                              ? const Text('Tambahkan File')
                                              : SizedBox(
                                                  child: Text(
                                                    nameCv!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                        ],
                                      )),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(top: 30),
                                  child: const Text(
                                      'Silakan upload : Portofolio (berupa gambar jpg bagi disainer grafis atau link youtube bagi videografer)'),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 45,
                                  width: 340,
                                  decoration: BoxDecoration(
                                    color: "E1E1E1".toColor(),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextButton(
                                      onPressed: () async {
                                        FilePickerResult? resPortofolio =
                                            await FilePicker.platform.pickFiles(
                                                type: FileType.custom,
                                                allowedExtensions: ['pdf']);
                                        if (resPortofolio != null) {
                                          PlatformFile portoFile =
                                              resPortofolio.files.first;
                                          setState(() {
                                            String name = portoFile.name;
                                            namePorto = name;
                                            var filePorto = File(resPortofolio
                                                .files.single.path
                                                .toString());
                                            int date = DateTime.now()
                                                .millisecondsSinceEpoch;
                                            fileNamePortofolio =
                                                date.toString() + name;
                                            UserServices().uploadPorto(
                                                filePorto, fileNamePortofolio);
                                          });
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.file_present_rounded),
                                          (namePorto == null)
                                              ? const Text('Tambahkan File')
                                              : SizedBox(
                                                  child: Text(
                                                    namePorto!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                        ],
                                      )),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                  'Informasi : \nProgram Magang ini bersifat unpaid/tidak bergaji. Jika Anda setuju maka silakan SUBMIT. Terimakasih'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              height: 42,
                              width: 150,
                              child: TextButton(
                                onPressed: (() async {
                                  Map dataPendaftaran = {
                                    'namaLengkap': _namaLengkap.text,
                                    'nik': _nomorNik.text,
                                    'jenisKelamin': _kelamin,
                                    'nomorWhatsapp': _nomorWhatsApp.text,
                                    'asalSekolah': _asalSekolah.text,
                                    'programStudi': _programStudi.text,
                                    'kotaAsal': _kotaAsal.text,
                                    'alasanMagang': _alasanMagang.text,
                                    'jenisMagang': _jenisMagang,
                                    'sistemMagang': _sistemMagang,
                                    'statusAnda': _statusAnda,
                                    'bukuInggris': _bahasaInggris,
                                    'whatsappDosen': _whatsappPembimbing.text,
                                    'programMagang': _programMagang,
                                    'jamKerja': _jamMagang,
                                    'yangDikuasai': _penguasaanSkil.text,
                                    'laptop': _laptop,
                                    'memilikiAlat': _alatDimiliki,
                                    'mulaiMagang': _mulaiMagang.text,
                                    'infoMagang': _infoMagang,
                                    'motor': _motor,
                                    'tglGabung': DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    'curriculumvitae': fileNameCv,
                                    'portofolio': fileNamePortofolio,
                                  };
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {
                                    return;
                                  } else {
                                    UserServices()
                                        .addPendaftaran(creds: dataPendaftaran);
                                  }
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: "28AF70".toColor(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Kirim",
                                  style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: "ffffff".toColor(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
        ),
      ],
    ));
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  final List<String> programMagang = [
    "R & D (Research and Development)",
    "Administrasi",
    "UI/UX",
    "Programmer (front end/backend)",
    "HR",
    "Photographer",
    "Videographer",
    "Social media specialist",
    "Content writer",
    "Marketing dan sales",
    "Desainer grafis",
    "Digital research",
    "Marcomm/public relation",
    "Host/presenter",
    "Tiktok creator",
    "Voice over talent",
    "Content planner",
    "Las",
    "Digital marketing"
  ];

  return programMagang
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}
