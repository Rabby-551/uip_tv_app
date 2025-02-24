import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Rabby',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white24),
              ),
              Text(
                "Let's watch today",
                style: TextStyle(fontSize: 12, color: Colors.white24),
              ),
            ],
          ),
          centerTitle: false,
          actions: const [
            Padding(
              padding:  EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                    'assets/mamun.jpg'), // Replace with actual image URL
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
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Categories
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                Text('See More', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white)),
              ],
            ),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['Action', 'Anime', 'Sci-fi', 'Thriller'].map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: Color(0xff221821),
                      label: Text(category,style: TextStyle(color: Colors.white54)),),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Featured Movie
            Container(
              width: double.infinity,
              height: screenWidth * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const SectionTitle(title: 'Trending Movies', color: Colors.white, subTitle: 'See more',),
            MovieList(),

            const SectionTitle(title: 'Continue Watching',color: Colors.white, subTitle: 'see More',),
            MovieList(),

            const SectionTitle(title: 'Recommended For You',color: Colors.white, subTitle: 'see More',),
            MovieList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  final String subTitle;

  const SectionTitle({required this.title, super.key, required this.color, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: color)),
          Text(subTitle, style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: color)),
        ],
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
