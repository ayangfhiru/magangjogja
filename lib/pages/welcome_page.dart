part of 'pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  int selectPage = 0;
  late String userRole = 'user';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: FutureBuilder<UserModel?>(
            future: UserServices().getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String role = snapshot.data!.role;
                return BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                  if (state is UserPendaftaran) {
                    return PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          selectPage = index;
                        });
                      },
                      children: const [
                        InfoPendaftaranWidget(),
                        InfoPendaftaranWidget(),
                        InfoPendaftaranWidget(),
                        DaftarMagangWidget(),
                      ],
                    );
                  } else {
                    return PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          selectPage = index;
                        });
                      },
                      children: [
                        // Beranda
                        Center(
                          child: (role == "user")
                              ? const Center(
                                  child: BerandaPage(),
                                )
                              : (role == "guru")
                                  ? const Center(
                                      child: AksesWidget(),
                                    )
                                  : (role == "admin")
                                      ? const Center(
                                          child: BerandaPage(),
                                        )
                                      : const SizedBox(),
                        ),

                        // Absensi
                        Center(
                          child: (role == "user")
                              ? const Center(
                                  child: AksesWidget(),
                                )
                              : (role == "guru")
                                  ? const Center(
                                      child: ListAbsensi(),
                                    )
                                  : (role == "admin")
                                      ? const Center(
                                          child: ListAbsensi(),
                                        )
                                      : const SizedBox(),
                        ),
                        // Kegiatan
                        Center(
                            child: (role == "user")
                                ? const Center(
                                    child: UserKegiatan(),
                                  )
                                : (role == "guru")
                                    ? const Center(
                                        child: ListKegiatan(),
                                      )
                                    : (role == "admin")
                                        ? const Center(
                                            child: ListKegiatan(),
                                          )
                                        : const SizedBox()),
                        // Status
                        const Center(
                          child: StatusPage(),
                        )
                      ],
                    );
                  }
                });
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
            },
          ),
        ),

        // bottom navbar
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavbar(
            selectedIndex: selectPage,
            onTap: (index) {
              setState(() {
                selectPage = index;
              });
              pageController.jumpToPage(selectPage);
            },
          ),
        ),
      ],
    );
  }
}
