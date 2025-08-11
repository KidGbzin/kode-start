part of '../details_handler.dart';

class _HeartButton extends StatelessWidget {

  final _DetailsController controller;

  const _HeartButton(this.controller);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.nIsFavorite,
      builder: (BuildContext context, bool isFavorite, Widget? _) {
        return IconButton(
          onPressed: controller.toggleFavorite, 
          icon: isFavorite ? const Icon(Icons.favorite, color: Colors.red, size: 31.46,)
                           : const Icon(Icons.favorite_border, color: Colors.white, size: 31.46),
        );
      }
    );
  }
}