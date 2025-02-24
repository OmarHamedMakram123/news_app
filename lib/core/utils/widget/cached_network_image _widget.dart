import '../../app_exports.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit? fit;

  const CachedNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      height: height.h,
      width: width.w,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
