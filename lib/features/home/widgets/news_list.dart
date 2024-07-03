import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project5/core/config/app_colors.dart';

import '../models/world_news.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        children: [
          ...List.generate(
            worldNews.length,
            (index) {
              return _NewsCard(news: worldNews[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.news});

  final WorldNews news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 251,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 78,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: news.image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            news.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 7),
          Expanded(
            child: Text(
              news.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.white50,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                news.ago,
                style: TextStyle(
                  color: AppColors.white50,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 2),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  color: AppColors.white50,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
