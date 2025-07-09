import 'package:backbase/common/theme/app_colors.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: AppColors.white,
         borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeShimmer(
              width: 100,
              radius: 4,
              fadeTheme: FadeTheme.light,
              millisecondsDelay: 300, height: 100,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeShimmer(
                  
                  height: 18,
                  width: 150,
                  radius: 4,
                  millisecondsDelay: 300,
                  fadeTheme: FadeTheme.light,
                ),
                SizedBox(height: 20),
                FadeShimmer(
                  height: 18,
                  millisecondsDelay: 300,
                  width: 170,
                  radius: 4,
                  fadeTheme: FadeTheme.light,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
