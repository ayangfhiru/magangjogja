part of 'widgets.dart';

class ListAbsensi extends StatefulWidget {
  const ListAbsensi({Key? key}) : super(key: key);

  @override
  State<ListAbsensi> createState() => _ListAbsensiState();
}

class _ListAbsensiState extends State<ListAbsensi> {
  @override
  void initState() {
    super.initState();
    AbsensiCubit().getListAnak;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: BlocBuilder<AbsensiCubit, List<ListAbsensiModel>>(
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
              }
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
                        Get.to(() => GuruAbsensi(id: res.id));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider((res
                                      .avatar ==
                                  null)
                              ? "http://10.0.2.2:8000/storage/avatar/default_avatar.png"
                              : "http://10.0.2.2:8000/storage/avatar/${res.avatar}"),
                        ),
                        title: Center(
                            child: Text(
                          res.namaLengkap,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
