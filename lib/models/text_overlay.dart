class TextOverlay {
  TextOverlay({
    required this.text,
    this.fontSize = 32,
    this.isBold = false,
    this.positionX = 0.5,
    this.positionY = 0.5,
    this.color = 0xFFFFFFFF,
  });

  final String text;
  final double fontSize;
  final bool isBold;
  final double positionX;
  final double positionY;
  final int color;
}
