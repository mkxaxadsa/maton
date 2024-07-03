import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom/custom_scaffold.dart';
import '../../core/widgets/your_version_field.dart';
import '../../core/widgets/your_version_text.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool active = false;

  void onChanged() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onGo() async {
    await saveUser(
      controller1.text,
      controller2.text,
    ).then((value) {
      context.go('/home');
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 127),
              const Spacer(flex: 2),
              SizedBox(
                // width: MediaQuery.of(context).size.width > 400 ? 400 : null,
                child: Row(
                  children: [
                    Text(
                      'Enter your name...',
                      style: TextStyle(
                        color: AppColors.white50,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              _NameField(
                controller: controller1,
                onChanged: onChanged,
              ),
              const SizedBox(height: 14),
              const Text(
                'What currency do you use?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              _CurrencySelectButton(
                controller: controller2,
                onChanged: onChanged,
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Go',
                active: active,
                onPressed: onGo,
              ),
              const SizedBox(height: 67),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Name',
          hintStyle: TextStyle(
            color: AppColors.white50,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}

class _CurrencySelectButton extends StatefulWidget {
  const _CurrencySelectButton({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  State<_CurrencySelectButton> createState() => _CurrencySelectButtonState();
}

class _CurrencySelectButtonState extends State<_CurrencySelectButton> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
                      ? '(${widget.controller.text})'
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
        SizedBox(height: expanded ? 0 : 130 + 45),
        if (expanded) ...[
          const SizedBox(height: 10),
          _CurrencyButton(
            title: '(\$)',
            current: widget.controller.text == '\$',
            onPressed: () {
              setState(() {
                widget.controller.text = '\$';
                widget.onChanged();
                expanded = false;
              });
            },
          ),
          const SizedBox(height: 10),
          _CurrencyButton(
            title: '(€)',
            current: widget.controller.text == '€',
            onPressed: () {
              setState(() {
                widget.controller.text = '€';
                widget.onChanged();
                expanded = false;
              });
            },
          ),
          const SizedBox(
            height: 20,
            child: YourVersionText(),
          ),
          YourVersionField(
            controller: widget.controller,
            maxLen: 1,
            onChanged: () {
              widget.onChanged();
            },
          ),
        ],
      ],
    );
  }
}

class _CurrencyButton extends StatelessWidget {
  const _CurrencyButton({
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
              fontWeight: FontWeight.w600,
              fontFamily: 'SFPro',
            ),
          ),
        ),
      ),
    );
  }
}
