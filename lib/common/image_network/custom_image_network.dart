import 'package:cached_network_image/cached_network_image.dart';

CachedNetworkImageProvider customCachedNetworkImageProvider(String url) {
  return CachedNetworkImageProvider(
    url,
    errorListener: () {},
  );
}
