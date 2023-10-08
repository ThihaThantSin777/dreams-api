import 'package:dreams_dictionary/resources/colors.dart';
import 'package:dreams_dictionary/resources/dimens.dart';
import 'package:flutter/material.dart';

class IndexAndContentWidget extends StatelessWidget {
  const IndexAndContentWidget({super.key, required this.index, required this.content});

  final int index;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kSP5x),
          alignment: Alignment.center,
          width: kCircleShapeContainerHeight,
          height: kCircleShapeContainerHeight,
          decoration: const BoxDecoration(color: kWhiteColor, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: kBlack12Color,
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]),
          child: Text(index.toString()),
        ),
        const SizedBox(
          width: kSP20x,
        ),
        Expanded(child: Text(content))
      ],
    );
  }
}
