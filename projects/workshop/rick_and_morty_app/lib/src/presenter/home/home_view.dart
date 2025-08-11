part of 'home_handler.dart';

class _HomeView extends StatefulWidget {
  
  final _HomeController controller;

  const _HomeView(this.controller);

  @override
  State<_HomeView> createState() => __HomeViewState();
}

class __HomeViewState extends State<_HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _Drawer(widget.controller),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 31.46,
                  ),
                );
              }
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
                    'RICK AND MORTY API',
                    style: Typography().kobe.regular,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: context.goToFavorites,
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 31.46,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: _SearchBar(widget.controller),
        ),
      ),
      body: _CharactersList(widget.controller),
    );
  }
}