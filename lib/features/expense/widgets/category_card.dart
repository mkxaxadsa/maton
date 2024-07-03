import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.controller,
    required this.selected,
    required this.onSelected,
  });

  final String title;
  final TextEditingController controller;
  final bool selected;
  final void Function() onSelected;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: widget.selected ? const Color(0xff500018) : Colors.transparent,
        ),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (widget.controller.text == widget.title) return;
          setState(() {
            widget.controller.text = widget.title;
            widget.onSelected();
          });
        },
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}
