part of 'favorites_handler.dart';

class _View extends StatelessWidget {

  final _FavoritesController controller;

  const _View(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            IconButton(
              onPressed: context.pop,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 31.46,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget> [
                  Image.asset(
                    'assets/logo.png',
                    height: 76.99,
                    width: 115,
                  ),
                  Text(
                    'FAVORITE CHARACTERS',
                    style: Typography().kobe.regular,
                  ),
                ],
              ),
            ),
            SizedBox.square(dimension: 47.46),
          ],
        ),
      ),
      body: _CharactersList(controller),
    );
  }
}