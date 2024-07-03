import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onDelete,
  });

  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      height: 56,
      child: Row(
        children: [
          CupertinoButton(
            onPressed: () {
              context.pop();
            },
            padding: EdgeInsets.zero,
            child: const Row(
              children: [
                SizedBox(width: 15),
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.red,
                ),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFPro',
                  ),
                ),
              ],
            ),
          ),
          if (onDelete != null) ...[
            const Spacer(),
            CupertinoButton(
              onPressed: onDelete,
              padding: EdgeInsets.zero,
              child: const Row(
                children: [
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFPro',
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.delete,
                    color: AppColors.red,
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
