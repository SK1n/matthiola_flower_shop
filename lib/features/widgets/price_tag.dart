import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    required this.price,
    super.key,
    this.width = 100,
    this.height = 300,
  });

  final String price;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: PriceTagPaint(context.colorScheme.secondaryContainer),
        child: Row(
          children: [
            const Gap(10),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  price, // Price with RON included
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white, // Solid white text
                      ),
                  maxFontSize: 30,
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}

class PriceTagPaint extends CustomPainter {
  const PriceTagPaint(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Solid color, no transparency
      ..style = PaintingStyle.fill;

    // Drawing a traditional price tag shape
    final path = Path()
      ..moveTo(0, size.height * .5) // Start at middle left
      ..lineTo(size.width * .15, 0) // Top left diagonal corner
      ..lineTo(size.width, 0) // Top right corner
      ..lineTo(size.width, size.height) // Bottom right corner
      ..lineTo(size.width * .15, size.height) // Bottom left diagonal corner
      ..lineTo(0, size.height * .5) // Back to the middle left
      ..close();

    canvas.drawPath(path, paint); // Draw the tag shape
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
