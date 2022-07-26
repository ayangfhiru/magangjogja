part of 'widgets.dart';

class InfoPendaftaranWidget extends StatelessWidget {
  const InfoPendaftaranWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Image(
          //   height: 150,
          //   width: 225,
          //   image: AssetImage('images/Dayflow_Avatar.png'),
          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 20),
          //   child: Text('Mohon Maaf Kamu \ntidak bisa mengakses \nhalaman ini',
          //       textAlign: TextAlign.center,
          //       style: GoogleFonts.roboto(
          //           fontSize: 16, fontWeight: FontWeight.bold)),
          // ),
          const AksesWidget(),
          Text(
            'Pergi ke halaman “Status” \nuntuk mendaftar',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
