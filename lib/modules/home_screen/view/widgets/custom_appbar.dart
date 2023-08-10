import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notes',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(.05)
          ),
          child: IconButton(
            icon: const Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
