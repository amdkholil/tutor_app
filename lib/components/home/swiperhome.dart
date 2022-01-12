import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperHome extends StatelessWidget {
  const SwiperHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 4),
      height: 254,
      width: size.width * 1,
      child: Swiper(
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              "https://via.placeholder.com/300x400?text=slide+$i",
              fit: BoxFit.fill,
            ),
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        duration: 500,
        itemCount: 5,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
