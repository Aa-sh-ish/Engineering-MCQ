import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerError extends StatelessWidget {
  const ShimmerError({
    super.key,
    required this.respose,
    required this.basecolor,
    required this.highlightcolor,
  });
  final Widget respose;
  final Color basecolor;
  final Color highlightcolor;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 3000),
      baseColor: basecolor,
      highlightColor: highlightcolor,
      child: respose,
    );
  }
}
