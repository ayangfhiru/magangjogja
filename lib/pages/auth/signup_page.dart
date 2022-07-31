part of 'auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rewPassController = TextEditingController();

  bool _scurePass = true;
  bool _scureRePass = true;
  late String password;
  late String rePassword;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rewPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 140),
            height: 230,
            width: 230,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('images/magangjogja.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              "Daftar",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 307,
              decoration: BoxDecoration(
                  color: "E1E1E1".toColor(),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: "Email...", border: InputBorder.none),
              )),
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 307,
            decoration: BoxDecoration(
              color: "E1E1E1".toColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              controller: passwordController,
              validator: (value) =>
                  value!.length < 6 ? 'Password too short.' : null,
              onSaved: (value) => password = value.toString(),
              obscureText: _scurePass,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Password...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _scurePass = !_scurePass;
                        });
                      },
                      icon: Icon(_scurePass
                          ? Icons.visibility
                          : Icons.visibility_off))),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 307,
            decoration: BoxDecoration(
              color: "E1E1E1".toColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              controller: rewPassController,
              style: const TextStyle(color: Colors.black),
              validator: (value) =>
                  value!.length < 6 ? 'Rewrite Password too short.' : null,
              onSaved: (value) => rePassword = value.toString(),
              obscureText: _scureRePass,
              decoration: InputDecoration(
                  hintText: "Rewrite Password...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _scureRePass = !_scureRePass;
                        });
                      },
                      icon: Icon(_scureRePass
                          ? Icons.visibility
                          : Icons.visibility_off))),
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 60),
              height: 42,
              width: 150,
              child: TextButton(
                onPressed: () {
                  Map creds = {
                    'name': 'user',
                    'email': emailController.text,
                    'password': passwordController.text,
                    'password_confirmation': rewPassController.text,
                    'device_name': 'mobile'
                  };
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    return;
                  } else {
                    AuthServices().register(creds: creds);
                    Get.back();
                    Get.to(() => const VerifikasiPage());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: "FFE064".toColor(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Daftar",
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: "000000".toColor(),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
