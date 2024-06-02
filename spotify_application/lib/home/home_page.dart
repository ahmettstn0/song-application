import 'package:flutter/material.dart';
import 'package:spotify_application/login/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Image.asset(
              'assets/songicon.jpeg',
              height: 100,
            ),
            SizedBox(width: 0.5),
            Text(
              'Song',
              style: TextStyle(
                color: Color.fromARGB(255, 32, 240, 39),
                fontWeight: FontWeight.bold,
                height: 90,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app,
                color: Color.fromARGB(255, 30, 215, 96)),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Evening',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 20, 
                children: [
                  _buildCard('Recently Played', Icons.history),
                  _buildCard('Made For You', Icons.music_note),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Your Library',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildLibrarySection(),
              SizedBox(height: 20),
              Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLibrarySection() {
    return Column(
      children: [
        _buildLibraryItem('Liked Songs', Icons.favorite),
        _buildLibraryItem('Playlists', Icons.playlist_play),
        _buildLibraryItem('Albums', Icons.album),
        _buildLibraryItem('Artists', Icons.person),
        _buildLibraryItem('Podcasts', Icons.mic),
      ],
    );
  }

  Widget _buildLibraryItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 30),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        
      },
    );
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildRecommendedCard('Top Hits', 'assets/top_hits.jpeg'),
            SizedBox(width: 20),
            _buildRecommendedCard('New Releases', 'assets/new_releases.jpeg'),
            SizedBox(width: 20),
            _buildRecommendedCard('Daily Mix', 'assets/daily_mix.jpeg'),
            SizedBox(width: 20),
            _buildRecommendedCard('Pop', 'assets/pop.jpeg'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedCard(String title, String imagePath) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
