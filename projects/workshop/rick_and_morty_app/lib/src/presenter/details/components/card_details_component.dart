part of '../details_handler.dart';

class _CardDetails extends StatelessWidget {

  final _DetailsController controller;

  const _CardDetails(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF87A1FA),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(controller.character.image),
                  fit: BoxFit.cover,
                ),
              ),
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                controller.character.name.toUpperCase(),
                style: Typography().kobe.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: status(controller.character.status, controller.character.species),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: textInfo('Gender:', controller.character.gender),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: textInfo('Origin:', controller.character.origin.name),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: textInfo('Last known location:', controller.character.location.name),
            ),
            ValueListenableBuilder(
              valueListenable: controller.nEpisodeName,
              builder: (BuildContext context, String value, Widget? _) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: textInfo('First seen in:', controller.nEpisodeName.value),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget status(String status, String species) {
    return Row(
      spacing: 10,
      children: <Widget> [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFFFFFFF),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(100),
            color: Color(0xFFD53C2E),
          ),
          height: 8,
          width: 8,
        ),
        Text(
          '$status - $species',
          style: Typography().kobe.medium,
        ),
      ],
    );
  }

  Widget textInfo(String title, String info) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Text(
          title,
          style: Typography().kobe.light,
        ),
        Text(
          info,
          style: Typography().kobe.medium,
        ),
      ],
    );
  }
}