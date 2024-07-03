import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:project5/features/home/models/world_news.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 17),
            const PageTitle('Settings'),
            const SizedBox(height: 47),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForView(
                          settings:
                              'https://docs.google.com/document/d/15hL9wlaQLs1AQLn42NrF5TjQHUD9_5ftrJW92fHRWqI/edit?usp=sharing'),
                    ),
                  );
                },
                child: const _SettingsTile(title: 'Terms of Use')),
            const SizedBox(height: 17),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForView(
                          settings:
                              'https://docs.google.com/document/d/1j3rekDHKn_H-63G7pIpCixw-x7Pdr1-dLJa9ypEvHJM/edit?usp=sharing'),
                    ),
                  );
                },
                child: const _SettingsTile(title: 'Privacy Policy')),
            const SizedBox(height: 17),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForView(
                        settings: 'https://forms.gle/Ea1Xjpmbtgn812L26'),
                  ),
                );
              },
              child: const _SettingsTile(title: 'Support Page'),
            ),
            const SizedBox(height: 17),
            InkWell(
              onTap: () {
                InAppReview.instance.openStoreListing(appStoreId: '6505144818');
              },
              child: const _SettingsTile(title: 'Rate app'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
