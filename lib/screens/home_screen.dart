import 'package:flutter/material.dart';
import 'package:uip_tv_app/core/models/movie_model.dart';
import 'package:uip_tv_app/screens/widgets/CustomBottomNavBar.dart';
import 'package:uip_tv_app/screens/widgets/movie_list.dart';
import 'package:uip_tv_app/screens/widgets/slide_movie_container.dart';
import 'package:uip_tv_app/screens/widgets/watched_movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff11161F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xff11161F),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Rabby',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0x80ffffff)),
              ),
              Text(
                "Let's watch today",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0x80ffffff),
                ),
              ),
            ],
          ),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://www.w3schools.com/W3CSS/img_avatar3.png',
                ), // Replace with actual image URL
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            const Row(
              children: [
                Expanded(
                  child: SearchBar(
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16)),
                    hintText: 'Search',
                    hintStyle: WidgetStatePropertyAll(
                        TextStyle(color: Color(0xff888A8F))),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Color(0xff888A8F))),
                    trailing: [
                      Icon(
                        Icons.search,
                        color: Color(0xff888A8F),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.tune,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 23),
            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text('See More',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 7),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  'All',
                  'Action',
                  'Anime',
                  'Sci-fi',
                  'Thriller',
                  'Comedy',
                  'Drama',
                ].map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: const Color(0xff221821),
                      label: Text(category,
                          style: const TextStyle(color: Colors.white54)),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Featured Movie
            SlideMovieContainer(),
            const SizedBox(height: 40),

            const SectionTitle(
              title: 'Trending Movies',
              color: Colors.white,
              subTitle: 'See more',
            ),
            MovieList(movies: [
              MovieModel(
                  title: 'X-Men Apocalypse',
                  posterPath:
                      'https://webneel.com/wnet/file/images/11-16/7-xmen-apocalypse-beautiful-movie-poster-design.preview.jpg'),
              MovieModel(
                  title: 'Inside Out',
                  posterPath:
                      'https://upload.wikimedia.org/wikipedia/en/f/f7/Inside_Out_2_poster.jpg'),
              MovieModel(
                  title: 'Venom',
                  posterPath:
                      'https://upload.wikimedia.org/wikipedia/en/thumb/1/10/Venom_%282018_film%29_poster.png/220px-Venom_%282018_film%29_poster.png'),
              MovieModel(
                  title: 'Fast & Furious',
                  posterPath:
                      'https://upload.wikimedia.org/wikipedia/en/5/54/Fast_and_the_furious_poster.jpg'),
            ]),
            const SizedBox(height: 40),
            const SectionTitle(
              title: 'Continue Watching',
              color: Colors.white,
              subTitle: 'see More',
            ),
            const SizedBox(height: 7),
            WatchedMovieList(
              movies: [
                MovieModel(
                    title: 'Captain America: Brave New World',
                    watchedTime: 0.3,
                    posterPath:
                        'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Captain_America_Brave_New_World_poster.jpg/220px-Captain_America_Brave_New_World_poster.jpg'),
                MovieModel(
                    watchedTime: 0.8,
                    title: 'Kraven the Hunter',
                    posterPath:
                        'https://upload.wikimedia.org/wikipedia/en/thumb/e/ec/Kraven_the_Hunter_%28film%29_poster.jpg/220px-Kraven_the_Hunter_%28film%29_poster.jpg'),
                MovieModel(
                  title: 'Red One',
                  watchedTime: 0.1,
                  posterPath:
                      'https://upload.wikimedia.org/wikipedia/en/thumb/2/25/Red_One_poster.jpg/220px-Red_One_poster.jpg',
                ),
              ],
            ),
            const SizedBox(height: 30),
            const SectionTitle(
              title: 'Recommended For You',
              color: Colors.white,
              subTitle: 'see More',
            ),
            const SizedBox(height: 7),
            MovieList(movies: [
              MovieModel(
                title: 'Buffalo Kids',
                posterPath:
                    'https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Buffalo_Kids.jpg/220px-Buffalo_Kids.jpg',
              ),
              MovieModel(
                title: 'Conclave',
                posterPath:
                    'https://upload.wikimedia.org/wikipedia/en/thumb/7/76/Conclave_film_poster.jpg/220px-Conclave_film_poster.jpg',
              ),
              MovieModel(
                title: 'The Kings Man',
                posterPath:
                    'https://upload.wikimedia.org/wikipedia/en/6/67/The_King%27s_Man.jpg',
              ),
              MovieModel(
                title: 'Thor: Love and Thunder',
                posterPath:
                    'https://upload.wikimedia.org/wikipedia/en/thumb/8/88/Thor_Love_and_Thunder_poster.jpeg/220px-Thor_Love_and_Thunder_poster.jpeg',
              ),
            ]),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: const CustomBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  final String subTitle;

  const SectionTitle(
      {required this.title,
      super.key,
      required this.color,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          Text(subTitle,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
