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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 140,
                height: 140,
                child: Image.network(
                  image!.toString(),
                  fit: BoxFit.cover,
                  errorBuilder: (context, object, staTracer) =>
                      Image.asset("assets/notfound.png"),
                ),
              ),
            ),
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

Widget checkUrlImage(String? url) {
  try {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 140,
        height: 140,
        child: Image.network(
          url!,
          fit: BoxFit.cover,
          errorBuilder: (context, object, staTracer) =>
              const Icon(Icons.error_outline_outlined),
        ),
      ),
    );
  } catch (e) {
    return const Icon(Icons.image);
  }
}
