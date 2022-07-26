part of 'widgets.dart';

class DaftarMagangWidget extends StatefulWidget {
  const DaftarMagangWidget({Key? key}) : super(key: key);

  @override
  State<DaftarMagangWidget> createState() => _DaftarMagangWidgetState();
}

class _DaftarMagangWidgetState extends State<DaftarMagangWidget> {
  final ImagePicker _picker = ImagePicker();
  late File uploadAvatar;
  late String urlAvatar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<UserModel?>(
          future: UserServices().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 180,
                width: 180,
                child: Center(
                  child: CircularProgressIndicator(
                    color: "C6EED8".toColor(),
                  ),
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   height: 180,
                  //   width: 180,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //         image: NetworkImage(snapshot.data!.avatar ??
                  //             snapshot.data!.profile_photo_path),
                  //         fit: BoxFit.fill),
                  //   ),
                  //   child: ConstrainedBox(
                  //     constraints: const BoxConstraints.expand(),
                  //     child: InkWell(
                  //       borderRadius: BorderRadius.circular(60),
                  //       onTap: () async {
                  //         var chosedAvatar = await _picker.pickImage(
                  //           source: ImageSource.gallery,
                  //         );
                  //         setState(
                  //           () {
                  //             uploadAvatar = File(chosedAvatar!.path);
                  //             UserServices().updateAvatar(uploadAvatar);
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: CachedNetworkImageProvider(
                        snapshot.data!.avatar ??
                            snapshot.data!.profile_photo_path),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () async {
                        var chosedAvatar = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(
                          () {
                            uploadAvatar = File(chosedAvatar!.path);
                            UserServices().updateAvatar(uploadAvatar);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: const Image(
            image: AssetImage('images/Dayflow_Avatar.png'),
          ),
        ),
        Text(
          'Daftar dulu yuk... \nBiar bisa magang sama kita',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 40,
          width: 145,
          child: TextButton(
            onPressed: () {
              Get.to(() => const PendaftaranPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: "FFE064".toColor(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Daftar disini',
              style: GoogleFonts.roboto(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
