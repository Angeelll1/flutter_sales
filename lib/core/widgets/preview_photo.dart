import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'appbar_default.dart';

class PreviewPhoto extends StatelessWidget {
  final String tag;
  final String path;

  PreviewPhoto({required this.tag, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(tag),
      body: GestureDetector(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: path.startsWith("http://") || path.startsWith("https://")
                    ? CachedNetworkImage(
                        imageUrl: path,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    : Image.file(File(path)))),
      ),
    );
  }
}
