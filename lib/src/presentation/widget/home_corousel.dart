import 'package:carousel_slider/carousel_slider.dart';
import 'package:clotheses_shop/src/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class CustomHomeCarousel extends StatelessWidget {
  const CustomHomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagesList = [
      AppImages.bannerImg,
      AppImages.bannerImg2,
      AppImages.bannerImg3,
    ];
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagesList[index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        height: 180,
      ),
    );
  }
}
