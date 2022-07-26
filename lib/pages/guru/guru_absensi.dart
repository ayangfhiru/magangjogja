part of 'guru.dart';

class GuruAbsensi extends StatefulWidget {
  const GuruAbsensi({required this.id, Key? key}) : super(key: key);

  final int id;

  @override
  State<GuruAbsensi> createState() => _GuruAbsensiState();
}

class _GuruAbsensiState extends State<GuruAbsensi> {
  final storage = const FlutterSecureStorage();
  late String? token;

  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
  var now = DateTime.now();
  late var currentMon = now.month;

  late EmployeeDataSource employeeDataSource;
  late List<GridColumn> _columns;

  Future<dynamic> generateEmployeeList() async {
    token = await storage.read(key: 'token');
    var url = Uri.parse('$baseUrl/guru-absensi?id=${widget.id}');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var list = json.decode(response.body)['data'] as List;

    List<GuruAbsensiModel> guruAbsensi = list
        .map<GuruAbsensiModel>((json) => GuruAbsensiModel.fromJson(json))
        .toList();
    employeeDataSource = EmployeeDataSource(guruAbsensi);
    return guruAbsensi;
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'tanggal',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Tanggal',
              ))),
      GridColumn(
          columnName: 'masuk',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Masuk'))),
      GridColumn(
          columnName: 'istirahat',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Istirahat'))),
      GridColumn(
          columnName: 'istirahat_masuk',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Istirahat Masuk'))),
      GridColumn(
          columnName: 'izin',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Izin'))),
      GridColumn(
          columnName: 'izin_masuk',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Izin Masuk'))),
      GridColumn(
          columnName: 'pulang',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Pulang'))),
      GridColumn(
          columnName: 'total',
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Total'))),
    ];
  }

  @override
  void initState() {
    super.initState();
    _columns = getColumns();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(months[currentMon - 3]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(months[currentMon - 2]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(months[currentMon - 1]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(months[currentMon]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(months[currentMon + 1]),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(top: 5),
                  child: FutureBuilder<dynamic>(
                      future: generateEmployeeList(),
                      builder: (context, data) {
                        if (data.connectionState == ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.black,
                          ));
                        } else {
                          if (data.hasData) {
                            return SfDataGridTheme(
                              data: SfDataGridThemeData(
                                  headerColor: "A9A9A9".toColor()),
                              child: SfDataGrid(
                                refreshIndicatorStrokeWidth: 3.0,
                                refreshIndicatorDisplacement: 60.0,
                                columnWidthMode:
                                    ColumnWidthMode.fitByColumnName,
                                frozenColumnsCount: 1,
                                onQueryRowHeight: (details) {
                                  return details
                                      .getIntrinsicRowHeight(details.rowIndex);
                                },
                                source: employeeDataSource,
                                columns: _columns,
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.black,
                            ));
                          }
                        }
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this.employees) {
    buildDataGridRow();
  }

  DateFormat date = DateFormat.MMMd();
  DateFormat time = DateFormat.jm();
  DateFormat timeTotal = DateFormat('HH:mm:ss');

  void buildDataGridRow() {
    _employeeDataGridRows = employees.map<DataGridRow>((e) {
      late int total;
      // lengkap
      if (e.masuk != null &&
          e.istirahatKeluar != null &&
          e.istirahatMasuk != null &&
          e.izinKeluar != null &&
          e.izinMasuk != null &&
          e.pulang != null) {
        total = (e.istirahatKeluar ?? 0) -
            (e.masuk ?? 0) +
            (e.izinKeluar ?? 0) -
            (e.istirahatMasuk ?? 0) +
            (e.pulang ?? 0) -
            (e.izinMasuk ?? 0);
      }
      // tidak izin keluar
      else if (e.masuk != null &&
          e.istirahatKeluar != null &&
          e.istirahatMasuk != null &&
          e.pulang != null) {
        total = (e.istirahatKeluar ?? 0) -
            (e.masuk ?? 0) +
            (e.pulang ?? 0) -
            (e.istirahatMasuk ?? 0);
      }
      // kurang pulang ->
      else if (e.masuk != null &&
          e.istirahatKeluar != null &&
          e.istirahatMasuk != null &&
          e.izinKeluar != null &&
          e.izinMasuk != null) {
        total = (e.istirahatKeluar ?? 0) -
            (e.masuk ?? 0) +
            (e.izinMasuk ?? 0) -
            (e.izinKeluar ?? 0) +
            (e.pulang ?? 0);
      }
      // kurang izin masuk ->
      else if (e.masuk != null &&
          e.istirahatKeluar != null &&
          e.istirahatMasuk != null &&
          e.izinKeluar != null) {
        total = (e.istirahatKeluar ?? 0) -
            (e.masuk ?? 0) +
            (e.izinKeluar ?? 0) -
            (e.istirahatMasuk ?? 0);
      }
      // kurang izin ->
      // atau kurang istirahat masuk ->
      else if ((e.masuk != null &&
              e.istirahatKeluar != null &&
              e.istirahatMasuk != null) ||
          (e.masuk != null && e.istirahatKeluar != null)) {
        total = (e.istirahatKeluar ?? 0) - (e.masuk ?? 0) + 0;
      } else {
        total = 0;
      }

      debugPrint('total $total');

      return DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'tanggal',
            value: date.format(DateTime.parse(e.tanggal!))),
        DataGridCell<String>(
            columnName: 'masuk',
            value: (e.masuk == null)
                ? '-'
                : time.format(DateTime.fromMillisecondsSinceEpoch(e.masuk!))),
        DataGridCell<String>(
            columnName: 'istirahat',
            value: (e.istirahatKeluar == null)
                ? '-'
                : time.format(
                    DateTime.fromMillisecondsSinceEpoch(e.istirahatKeluar!))),
        DataGridCell<String>(
            columnName: 'istirahat_masuk',
            value: (e.istirahatMasuk == null)
                ? '-'
                : time.format(
                    DateTime.fromMillisecondsSinceEpoch(e.istirahatMasuk!))),
        DataGridCell<String>(
            columnName: 'izin',
            value: (e.izinKeluar == null)
                ? '-'
                : time.format(
                    DateTime.fromMillisecondsSinceEpoch(e.izinKeluar!))),
        DataGridCell<String>(
            columnName: 'izin_masuk',
            value: (e.izinMasuk == null)
                ? '-'
                : time
                    .format(DateTime.fromMillisecondsSinceEpoch(e.izinMasuk!))),
        DataGridCell<String>(
            columnName: 'pulang',
            value: (e.pulang == null)
                ? "-"
                : time.format(DateTime.fromMillisecondsSinceEpoch(e.pulang!))),
        DataGridCell<String>(
          columnName: 'total',
          value: (timeTotal.format(
            DateTime.fromMillisecondsSinceEpoch(total).toUtc(),
          )),
        ),
      ]);
    }).toList();
  }

  List<GuruAbsensiModel> employees = [];

  List<DataGridRow> _employeeDataGridRows = [];

  @override
  List<DataGridRow> get rows => _employeeDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      Color getBackgroundColor() {
        // background row
        final int index = effectiveRows.indexOf(row);
        if (index % 2 != 0) {
          return "EDEDED".toColor();
        }

        return Colors.transparent;
      }

      return Container(
        color: getBackgroundColor(),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(e.value?.toString() ?? ''),
      );
    }).toList());
  }

  void updateDataGrid() {
    notifyListeners();
  }
}
