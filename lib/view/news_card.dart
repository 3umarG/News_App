import 'package:flutter/material.dart';
import 'contatnts.dart';

class NewsCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  const NewsCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            checkUrl(image),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Text(
                      description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

Widget checkUrl(String? url) {
  try {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url!,
        height: 140,
        width: 140,
        fit: BoxFit.cover,
      ),
    );
  } catch (e) {
    return const Icon(Icons.image);
  }
}
