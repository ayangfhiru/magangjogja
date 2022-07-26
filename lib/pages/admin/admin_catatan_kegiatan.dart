part of 'admin.dart';

class AdminCatatanKegiatan extends StatefulWidget {
  const AdminCatatanKegiatan({required this.id, Key? key}) : super(key: key);
  final int id;

  @override
  State<AdminCatatanKegiatan> createState() => _AdminCatatanKegiatanState();
}

class _AdminCatatanKegiatanState extends State<AdminCatatanKegiatan> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  late DateTime _focusedDay;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      child: StickyHeader(
        header: Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 5),
          color: "EDEDED".toColor(),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                  label: const Text(""))
            ],
          ),
        ),
        content: Column(
          children: [
            FutureBuilder<List<DetailKegiatanGuruModel>>(
              future: KegiatanServices().getDetailCatatanById(id: widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                } else {
                  if (snapshot.hasData) {
                    _focusedDay = DateTime.fromMillisecondsSinceEpoch(
                        snapshot.data!.first.tanggal);
                    return Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.utc(2022),
                          lastDay: DateTime.utc(2099),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                          // style calendar
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                              color: "99CCFF".toColor(),
                              shape: BoxShape.rectangle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: "C6EED8".toColor(),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            DateFormat.yMMMd().format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    snapshot.data!.first.tanggal)),
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: 270,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: "EDEDED".toColor(),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              snapshot.data!.first.namaLengkap,
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: "EDEDED".toColor(),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data!.first.catatan,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            'Apakah kamu menyetujuinya?',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 45,
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: "C4C4C4".toColor(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "No",
                                  style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: "FFFFFF".toColor(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 100,
                              child: TextButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: "3DC484".toColor(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Yes",
                                  style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: "FFFFFF".toColor(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
