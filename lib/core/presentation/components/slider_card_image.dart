import 'package:flutter/material.dart';
import 'package:show_hub/core/presentation/components/image_with_shimmer.dart';
import 'package:show_hub/core/resources/app_colors.dart';

class SliderCardImage extends StatelessWidget {
  final String imageUrl;
  const SliderCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black,
            AppColors.black,
            AppColors.transparent,
          ],
          stops: [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(
            0,
            0,
            bounds.width,
            bounds.height,
          ),
        );
      },
      child: ImageWithShimmer(
        imageUrl: imageUrl,
        height: size.height * 0.6,
        width: double.infinity,
      ),
    );
  }
}
