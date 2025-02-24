import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideMovieContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'https://webneel.com/wnet/file/images/11-16/8-xmen-movie-poster-design.preview.jpg',
      'https://webneel.com/wnet/file/images/11-16/10-enders-game-movie-poster-designs.jpg',
      'https://webneel.com/wnet/file/images/12-17/3-dunkirk-vfx-movie-poster.preview.jpg',
      'https://webneel.com/wnet/file/images/11-16/8-xmen-movie-poster-design.preview.jpg',
      'https://webneel.com/wnet/file/images/11-16/10-enders-game-movie-poster-designs.jpg',
      'https://webneel.com/wnet/file/images/12-17/3-dunkirk-vfx-movie-poster.preview.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
      ),
      items: list
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
