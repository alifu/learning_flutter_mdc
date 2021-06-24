import 'package:flutter/cupertino.dart';

enum TinyTabIndicatorSize { tiny, half, full }

class TinyTabIndicator extends Decoration {
  TinyTabIndicator(
      {Key? key,
      required this.indicatorHeight,
      required this.indicatorColor,
      required this.indicatorSize});

  final double indicatorHeight;
  final Color indicatorColor;
  final TinyTabIndicatorSize indicatorSize;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TinyTabIndicatorPainter(this, onChanged);
  }
}

class _TinyTabIndicatorPainter extends BoxPainter {
  final TinyTabIndicator indicator;

  _TinyTabIndicatorPainter(this.indicator, VoidCallback? onChange)
      : super(onChange);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Rect rect;
    if (indicator.indicatorSize == TinyTabIndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size!.height - indicator.indicatorHeight)) &
          Size(configuration.size!.width, indicator.indicatorHeight);
    } else if (indicator.indicatorSize == TinyTabIndicatorSize.half) {
      rect = Offset(offset.dx,
              (configuration.size!.height - indicator.indicatorHeight)) &
          Size(configuration.size!.width / 2, indicator.indicatorHeight);
    } else {
      rect = Offset(offset.dx + 32.0,
              (configuration.size!.height - indicator.indicatorHeight)) &
          Size(40, indicator.indicatorHeight);
    }

    final Paint paint = Paint();
    paint.color = indicator.indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            rect, Radius.circular(indicator.indicatorHeight / 2.0)),
        paint);
  }
}
