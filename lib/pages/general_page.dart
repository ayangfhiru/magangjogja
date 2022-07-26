part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    // child ?? SizedBox(),
                    // SizedBox()
                    child
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
