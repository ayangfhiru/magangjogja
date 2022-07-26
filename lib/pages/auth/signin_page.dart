part of 'auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String password;

  @override
  void initState() {
    _emailController.text = 'ghege@gmail.com';
    _passwordController.text = 'password';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
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
              "Masuk",
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
                controller: _emailController,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter valid Email' : null,
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
              controller: _passwordController,
              validator: (value) =>
                  value!.length < 6 ? 'Please enter password' : null,
              onSaved: (value) => password = value.toString(),
              obscureText: _obscureText,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Password...",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 42,
            width: 150,
            child: TextButton(
              onPressed: () {
                Map creds = {
                  'email': _emailController.text,
                  'password': _passwordController.text,
                  'device_name': 'mobile'
                };
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  return;
                } else {
                  Provider.of<AuthCubit>(context, listen: false)
                      .login(creds: creds);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: "FFE064".toColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: "000000".toColor(),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    "Lupa password? ",
                    style: GoogleFonts.roboto(
                        fontSize: 13, fontWeight: FontWeight.w300),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text("Reset aja",
                      style: GoogleFonts.roboto(
                          fontSize: 13, fontWeight: FontWeight.w400)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: Text(
                  "Ingin magang bersama kami? ",
                  style: GoogleFonts.roboto(
                      fontSize: 13, fontWeight: FontWeight.w300),
                )),
                TextButton(
                  onPressed: (() {
                    Get.to(() => const SignUpPage());
                    // Get.to(() => const PendaftaranPage());
                  }),
                  child: Text(
                    "Daftar yuk",
                    style: GoogleFonts.roboto(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
