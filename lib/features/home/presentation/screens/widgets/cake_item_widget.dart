import 'package:cached_network_image/cached_network_image.dart';
import 'package:cake_local/core/styles/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/app_colors.dart';

class CakeItem extends StatelessWidget {
  const CakeItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onTap,
  });

  final String imageUrl;
  final String name;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 179.w,
      height: 250.h,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],

        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 150.w,
              height: 135.h,
              errorWidget:
                  (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
            ),
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.itemStyle.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price, style: AppStyles.priceStyle),
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Icons.ads_click_rounded,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
