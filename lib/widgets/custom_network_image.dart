import 'package:feribot_lines/utils/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({Key? key, this.url = ""}) : super(key: key);
  String url;
  @override
  Widget build(BuildContext context) {
    url = url.isNotEmpty ? url : "";
    // return Image(
    //   image: NetworkImageWithRetry(
    //     url,
    //     fetchStrategy: (uri, failure) async {
    //       if (failure != null) {
    //         return FetchInstructions.attempt(
    //           uri: Uri.parse(Strings.emptyFerryImagePath),
    //           timeout: const Duration(seconds: 10),
    //         );
    //       } else {
    //         return FetchInstructions.giveUp(uri: uri);
    //       }
    //     },
    //   ),
    //   fit: BoxFit.contain,
    //   loadingBuilder: (context, widget, imageChunkEvent) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    return ImageNetwork(
      image: url,
      height: 48,
      width: 48,
      duration: 100,
      curve: Curves.easeIn,
      onPointer: false,
      debugPrint: false,
      fullScreen: false,
      fitAndroidIos: BoxFit.contain,
      fitWeb: BoxFitWeb.contain,
      onLoading: const CircularProgressIndicator(
        strokeWidth: 2,
        color: ColorsConstants.grey,
      ),
      onError: const Icon(
        Icons.directions_ferry_rounded,
        color: ColorsConstants.lightPrimary,
      ),
    );
  }
}
