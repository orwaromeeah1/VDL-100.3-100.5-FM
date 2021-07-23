import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

Widget cachedImageWidget(BuildContext context, String image) {
  return CachedNetworkImage(
    imageUrl: image,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: 40,
      width: 40,
      child: Center(
        child: Container(
            height: 20,
            width: 20,
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator(
                    color: blue,
                  )),
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
