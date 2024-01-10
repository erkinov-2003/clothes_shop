import 'package:clotheses_shop/src/controller/main_controller.dart';
import 'package:clotheses_shop/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({
    super.key,
    required this.title,
    required this.price,
    required this.images,
    required this.index,
  });
  final String title;
  final String price;
  final String images;
  final int index;

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.112,
            width: size.width * 0.255,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontFamily: "Jakarta",
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: size.height * 0.013),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.whiteColor,
                          fontFamily: "Jakarta",
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            mainController.deleteFavoriteList(index);
                          },
                          child: const Icon(
                            Icons.clear,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
