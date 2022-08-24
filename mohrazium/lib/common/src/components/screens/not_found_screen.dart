part of common.components;

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/not_found.png",
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                 SizedBox(
height: MediaQuery.of(context).size.height * 0.05,                ),
                const Text(
                  "اوه, متاسفم!",
                  style: TextStyle(fontSize: 20, fontFamily: 'B Titr'),
                ),
               const SizedBox(
                  height: 10,
                ),
                const Text(
                  "صفحه مورد نظر یافت نشد.",
                  style: TextStyle(fontSize: 18, fontFamily: 'B Titr'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
