part of 'user.dart';

class UserKegiatan extends StatefulWidget {
  const UserKegiatan({Key? key}) : super(key: key);

  @override
  State<UserKegiatan> createState() => _UserKegiatanState();
}

class _UserKegiatanState extends State<UserKegiatan> {
  TextEditingController catatanController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String dateNote = "Today";
  String dateSelected = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(padding: const EdgeInsets.only(bottom: 95), children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2022),
                    lastDay: DateTime.utc(2099),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;

                          dateNote = DateFormat.yMMMEd()
                              .format(_selectedDay!)
                              .toString();
                          dateSelected = DateTime.parse("$selectedDay")
                              .millisecondsSinceEpoch
                              .toString();
                        });
                      }
                    },
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
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                dateNote,
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
                child: FutureBuilder<UserForKegiatanModel?>(
                  future: KegiatanServices().getUserForKegiatan(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Name...",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.namaLengkap,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('error'),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: "EDEDED".toColor(),
                ),
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: catatanController,
                    decoration: const InputDecoration(
                      hintText: "Tambah Catatan",
                      border: InputBorder.none,
                    )),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () async {
                    Map data = {
                      'tanggal': dateSelected,
                      'catatan': catatanController.text
                    };
                    if (catatanController.text.isNotEmpty) {
                      var hasil = KegiatanServices().addCatatan(data: data);
                      debugPrint("$hasil");
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>("3DC484".toColor()),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ))),
                  child: Text("Kirim",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      )),
                ),
              ),
            ),
          ],
        ),
      ])
    ]);
  }
}
