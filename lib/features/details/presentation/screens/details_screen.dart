import 'package:cached_network_image/cached_network_image.dart';
import 'package:cake_local/core/styles/app_colors.dart';
import 'package:cake_local/core/styles/app_styles.dart';
import 'package:cake_local/core/widgets/primary_button_widget.dart';
import 'package:cake_local/features/home/data/models/cake_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.cake});
  final CakeModel cake;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: AppColors.cardColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: cake.imageUrl ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 327.h,
                ),
                SizedBox(height: 16.h),
                Text(cake.name, style: AppStyles.titleStyle),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cake.rate.toString(),
                      style: AppStyles.priceStyle.copyWith(fontSize: 20),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 222, 173, 36),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  cake.description,
                  style: AppStyles.itemStyle.copyWith(fontSize: 20.sp),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Price ${cake.price} \$',
                  style: TextStyle(
                    color: const Color(0xFFE4AC4F),
                    fontSize: 22,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 120.h),

                PrimayButtonWidget(
                  buttonText: 'Add to cart',
                  height: 56.h,
                  bordersRadius: 100.r,
                  fontSize: 16.sp,

                  onPress: () {
                    // Add your add to cart logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
