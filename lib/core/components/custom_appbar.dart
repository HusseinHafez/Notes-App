import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title = 'Notes',
    this.icon = Icons.search,
    required this.onPressed,
    this.isHome = false,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isHome)
          IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(.05)),
          child: IconButton(
            icon: Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}
