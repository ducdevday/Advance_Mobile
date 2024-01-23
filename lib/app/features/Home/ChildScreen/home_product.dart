import 'package:advance_mobile/app/features/Home/main.dart';
import 'package:flutter/material.dart';
import 'package:advance_mobile/app/config/color.dart';
import 'package:advance_mobile/app/config/style.dart';
import 'package:advance_mobile/app/model/mode.dart';

class HomeProduct extends StatelessWidget {
  final Product product;

  const HomeProduct(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xfff4f4f3),
                    shape: BoxShape.circle,
                  ),
                ),
                Image.network(
                  product.imageUrl!,
                  height: 68,
                  width: 58,
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.mediumTextStyleDark
                            .copyWith(color: const Color(0xff555555))),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(product.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.normalTextStyleDark
                            .copyWith(color: const Color(0xff555555))),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                product.sizeList![0].price.toString() + "\$",
                style: AppStyle.mediumTextStyleDark
                    .copyWith(color: AppColor.headingColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
