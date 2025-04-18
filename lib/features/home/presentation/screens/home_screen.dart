import 'package:cake_local/core/styles/app_colors.dart';
import 'package:cake_local/core/styles/app_styles.dart';
import 'package:cake_local/features/add_cake/presentation/screens/add_cake.dart';
import 'package:cake_local/features/details/presentation/screens/details_screen.dart';
import 'package:cake_local/features/home/data/db_helper/db_helper.dart';
import 'package:cake_local/features/home/data/models/cake_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/cake_item_widget.dart';

DatabaseHelper dbHelper = DatabaseHelper.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        backgroundColor: AppColors.cardColor,
        title: Text('Home', style: AppStyles.titleStyle),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: dbHelper.getMeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No Meals Found",
                          style: AppStyles.itemStyle,
                        ),
                      );
                    }
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 22.sp,
                        crossAxisSpacing: 16.sp,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        CakeModel cake = snapshot.data![index];
                        return CakeItem(
                          imageUrl: cake.imageUrl ?? "",
                          name: cake.name,
                          price: cake.price.toString(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen(cake: cake);
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text("No Meals Found", style: AppStyles.itemStyle),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white, size: 30.sp),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddCake();
              },
            ),
          );
        },
      ),
    );
  }
}

// todo
