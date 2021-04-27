import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTemplate extends StatelessWidget {
  final shimmerTemplate;
  ShimmerTemplate(this.shimmerTemplate);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(child: shimmerTemplate),
      baseColor: Colors.grey[400],
      highlightColor: Colors.white,
      enabled: true,
    );
  }
}
