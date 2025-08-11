part of '../favorites_handler.dart';

class _CharacterTile extends StatelessWidget {
  
  final Character character;

  _CharacterTile(this.character);

  final BorderRadius _borderRadius = BorderRadius.circular(16);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goToDetails(character),
      borderRadius: _borderRadius,
      child: Ink(
        height: 160,
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget> [
              Image.network(
                character.image,
                fit: BoxFit.cover,
                frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    child: child,
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                    color: Color(0xFF87A1FA),
                  ),
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    character.name.toUpperCase(),
                    style: Typography().kobe.black,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
