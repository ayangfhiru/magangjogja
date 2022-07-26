part of 'widgets.dart';

class AksesWidget extends StatelessWidget {
  const AksesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            height: 150,
            width: 225,
            image: AssetImage('images/Dayflow_Avatar.png'),
          ),
          Text(
            "Mohon Maaf Kamu\ntidak bisa mengakses\nhalaman ini",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
