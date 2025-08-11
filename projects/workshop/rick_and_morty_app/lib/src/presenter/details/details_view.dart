part of 'details_handler.dart';

class _DetailsView extends StatelessWidget {

  final _DetailsController controller;

  const _DetailsView(this.controller);

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
                    'RICK AND MORTY API',
                    style: Typography().kobe.regular,
                  ),
                ],
              ),
            ),
            _HeartButton(controller),
          ],
        ),
        toolbarHeight: 130,
      ),
      body: _CardDetails(controller),
    );
  }
}