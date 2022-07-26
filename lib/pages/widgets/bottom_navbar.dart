part of 'widgets.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

  final Function(int index) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      color: "D9D9D9".toColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  onTap(0);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      'images/navbar_homepage${(selectedIndex == 0) ? '.png' : '_normal.png'}',
                    ),
                    fit: BoxFit.contain,
                  )),
                ),
              ),
              Text(
                "Beranda",
                style: GoogleFonts.roboto(
                    color: "3DC484".toColor(),
                    fontWeight: FontWeight.w300,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  onTap(1);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'images/navbar_absensi${(selectedIndex == 1) ? '.png' : '_normal.png'}'))),
                ),
              ),
              Text(
                "Absensi",
                style: GoogleFonts.roboto(
                    color: "3DC484".toColor(),
                    fontWeight: FontWeight.w300,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  onTap(2);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'images/navbar_catatan${(selectedIndex == 2) ? '.png' : '_normal.png'}'))),
                ),
              ),
              Text(
                "Catatan Kegiatan",
                style: GoogleFonts.roboto(
                    color: "3DC484".toColor(),
                    fontWeight: FontWeight.w300,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    onTap(3);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/navbar_status${(selectedIndex == 3) ? '.png' : '_normal.png'}'))),
                  )),
              Text(
                "Status",
                style: GoogleFonts.roboto(
                    color: "3DC484".toColor(),
                    fontWeight: FontWeight.w300,
                    fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
