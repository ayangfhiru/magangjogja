part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final storage = const FlutterSecureStorage();
  late final String? token;

  void readToken() async {
    token = await storage.read(key: 'token');
    debugPrint('myToken $token');
  }

  @override
  void initState() {
    readToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthVerification) {
            return const WelcomePage();
          } else if (state is AuthWelcome) {
            return const WelcomePage();
          } else if (state is AuthInitial) {
            return const SignInPage();
          } else {
            return const SignInPage();
          }
        },
      ),
    );
  }
}
