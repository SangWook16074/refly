import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class UserImage extends StatelessWidget {
  final String url;
  const UserImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
    );
  }
}
