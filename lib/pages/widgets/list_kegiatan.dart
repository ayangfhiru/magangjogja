part of 'widgets.dart';

class ListKegiatan extends StatefulWidget {
  const ListKegiatan({Key? key}) : super(key: key);

  @override
  State<ListKegiatan> createState() => _ListKegiatanState();
}

class _ListKegiatanState extends State<ListKegiatan> {
  @override
  void initState() {
    super.initState();
    KegiatanGuruCubit().getKegiatanGuru;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: BlocBuilder<KegiatanGuruCubit, List<KegiatanGuruModel>>(
            builder: (context, state) {
              if (state.isEmpty) {
                return Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Dayflow_Avatar.png'),
                      ),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    var res = state[index];
                    return Card(
                      color: "3DC484".toColor(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => AdminCatatanKegiatan(id: res.id));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                "http://10.0.2.2:8000/storage/avatar/${res.avatar}"),
                          ),
                          title: Text(
                            res.namaLengkap,
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            res.catatan,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                          trailing: Text(
                            DateFormat.yMMMd().format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    res.tanggal)),
                            style: GoogleFonts.roboto(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
