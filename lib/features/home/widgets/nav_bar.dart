import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        color: AppColors.card,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  title: 'Home',
                  icon: Icons.home,
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  title: 'Activities',
                  icon: Icons.currency_exchange,
                  active: state is HomeActivities,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _NavBarButton(
                  title: 'Settings',
                  icon: Icons.settings_outlined,
                  active: state is HomeSettings,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.title,
    required this.icon,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: 62,
        height: 52,
        decoration: BoxDecoration(
          color: active ? AppColors.activeNavBar : null,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (active)
              BoxShadow(
                color: AppColors.black25,
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            title == 'Settings'
                ? SvgPicture.asset('assets/settings.svg')
                : Icon(
                    icon,
                    size: 25,
                    color: const Color(0xffffffff).withOpacity(0.67),
                  ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                color: const Color(0xffffffff).withOpacity(0.67),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
