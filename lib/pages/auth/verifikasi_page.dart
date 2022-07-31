part of 'auth.dart';

class VerifikasiPage extends StatefulWidget {
  const VerifikasiPage({Key? key}) : super(key: key);

  @override
  State<VerifikasiPage> createState() => _VerifikasiPageState();
}

class _VerifikasiPageState extends State<VerifikasiPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80),
            height: 201,
            width: 201,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2021/11/30/1012979993.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 320,
                width: 180,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/hands_verifikasi.png'))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 240,
                      child: Text(
                          "Cek email terbaru kamu untuk melakukan verifikasi",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text('Belum Terkirim?',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w500))),
                    Container(
                      width: 150,
                      height: 40,
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const SignInPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: "FFE064".toColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Kirim ulang'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
