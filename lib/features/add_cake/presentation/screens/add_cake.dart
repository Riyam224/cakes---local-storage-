// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:cake_local/core/styles/app_colors.dart';
import 'package:cake_local/core/styles/app_styles.dart';
import 'package:cake_local/core/widgets/custom_text_field.dart';
import 'package:cake_local/core/widgets/primary_button_widget.dart';
import 'package:cake_local/features/home/data/db_helper/db_helper.dart';
import 'package:cake_local/features/home/data/models/cake_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/presentation/screens/home_screen.dart';

class AddCake extends StatefulWidget {
  AddCake({super.key});

  static const routeName = '/addCake';

  @override
  State<AddCake> createState() => _AddCakeState();
}

class _AddCakeState extends State<AddCake> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // todo database
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.cardColor,
        title: Text(
          "Add Meal",
          style: AppStyles.titleStyle.copyWith(color: AppColors.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child:
                isLoading == true
                    ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: SizedBox(
                          width: 40.sp,
                          height: 40.sp,
                          child: const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("cake Name", style: AppStyles.itemStyle),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          controller: mealNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add meal name";
                            } else if (val.length < 3) {
                              return "please add more than 3 characters";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text("Image URl", style: AppStyles.itemStyle),
                        SizedBox(height: 8.0),
                        CustomTextField(
                          controller: imageUrlController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add image url ";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text("Rate", style: AppStyles.itemStyle),
                        SizedBox(height: 8.0),
                        CustomTextField(
                          controller: rateController,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add rate";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text("Time", style: AppStyles.itemStyle),
                        SizedBox(height: 8.0),
                        CustomTextField(
                          controller: timeController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add Time for Meal";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text("Price", style: AppStyles.itemStyle),
                        SizedBox(height: 8.0),
                        CustomTextField(
                          controller: priceController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add Price for Meal";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text("Description", style: AppStyles.itemStyle),
                        SizedBox(height: 8.0),
                        SizedBox(height: 8.0),
                        CustomTextField(
                          controller: descriptionController,
                          maxLines: 4,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add description for Meal";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 50.0),
                        PrimayButtonWidget(
                          buttonText: "Add Meal",
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              // todo save to database
                              CakeModel meal = CakeModel(
                                name: mealNameController.text,
                                imageUrl: imageUrlController.text,
                                rate: double.parse(rateController.text),
                                description: descriptionController.text,
                                time: timeController.text,
                                price: double.parse(priceController.text),
                              );

                              dbHelper.insertMeal(meal).then((value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => HomeScreen(),
                                  ),
                                );
                              });
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
