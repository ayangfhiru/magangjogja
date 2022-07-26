part of 'guru.dart';

class GuruKegiatan extends StatefulWidget {
  const GuruKegiatan({Key? key}) : super(key: key);

  @override
  State<GuruKegiatan> createState() => _GuruKegiatanState();
}

class _GuruKegiatanState extends State<GuruKegiatan> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<KegiatanGuruCubit, List<KegiatanGuruModel>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                var res = state[index];
                return Card(
                  color: "3DC484".toColor(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {
                      debugPrint("${res.id}");
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "http://10.0.2.2:8000/storage/avatar/${res.avatar}"),
                      ),
                      title: Text(res.namaLengkap),
                      subtitle: Text(
                        res.catatan,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      trailing: Text(DateFormat.yMMMd().format(
                          DateTime.fromMillisecondsSinceEpoch(res.tanggal))),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
