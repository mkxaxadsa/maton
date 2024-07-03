import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class PeriodCard extends StatefulWidget {
  const PeriodCard({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  State<PeriodCard> createState() => _PeriodCardState();
}

class _PeriodCardState extends State<PeriodCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              expanded = !expanded;
            });
          },
          padding: EdgeInsets.zero,
          child: Container(
            height: 60,
            // width: MediaQuery.of(context).size.width > 400 ? 400 : null,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(width: 40),
                const Spacer(),
                Text(
                  widget.controller.text.isNotEmpty
                      ? widget.controller.text
                      : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SFPro',
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 25,
                  child: AnimatedRotation(
                    turns: expanded ? 1 / 2 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
        if (expanded) ...[
          const SizedBox(height: 10),
          _PeriodButton(
            title: 'Day',
            current: widget.controller.text == 'Day',
            onPressed: () {
              setState(() {
                widget.controller.text = 'Day';
                widget.onChanged();
                expanded = false;
              });
            },
          ),
          const SizedBox(height: 10),
          _PeriodButton(
            title: 'Week',
            current: widget.controller.text == 'Week',
            onPressed: () {
              setState(() {
                widget.controller.text = 'Week';
                widget.onChanged();
                expanded = false;
              });
            },
          ),
          const SizedBox(height: 10),
          _PeriodButton(
            title: 'Month',
            current: widget.controller.text == 'Month',
            onPressed: () {
              setState(() {
                widget.controller.text = 'Month';
                widget.onChanged();
                expanded = false;
              });
            },
          ),
          const SizedBox(height: 10),
          _PeriodButton(
            title: 'Year',
            current: widget.controller.text == 'Year',
            onPressed: () {
              setState(() {
                widget.controller.text = 'Year';
                widget.onChanged();
                expanded = false;
              });
            },
          ),
        ],
      ],
    );
  }
}

class _PeriodButton extends StatelessWidget {
  const _PeriodButton({
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final bool current;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: current ? const Color(0xff500018) : Colors.transparent,
        ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}
