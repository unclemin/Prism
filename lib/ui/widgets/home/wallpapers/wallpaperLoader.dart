import 'package:Prism/ui/widgets/home/wallpapers/loading.dart';
import 'package:Prism/ui/widgets/home/wallpapers/wallpaperGrid.dart';
import 'package:flutter/material.dart';

class WallpaperLoader extends StatefulWidget {
  final Future future;
  final String provider;
  WallpaperLoader({@required this.future, @required this.provider});
  @override
  _WallpaperLoaderState createState() => _WallpaperLoaderState();
}

class _WallpaperLoaderState extends State<WallpaperLoader> {
  Future _future;

  @override
  void initState() {
    _future = widget.future;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (ctx, snapshot) {
        if (snapshot == null) {
          print("snapshot null");
          return LoadingCards();
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          print("snapshot none, waiting");
          return LoadingCards();
        } else {
          return WallpaperGrid(
            provider: widget.provider,
          );
        }
      },
    );
  }
}
