import 'package:flutter/material.dart';
import 'movieitems.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.9; 
    final imageWidth = containerWidth * 0.67; 
    final containerPadding = screenWidth * 0.02; 

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text("Favorite Movies"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: MovieItem.favoriteMovies.map((item) {
            return Container(
              width: containerWidth,
              margin: EdgeInsets.symmetric(vertical: containerPadding),
              padding: EdgeInsets.all(containerPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: imageWidth,
                    height: imageWidth * 0.5, 
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: containerPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.movieName,
                          style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Year: ${item.releaseYear}",
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "IMDb: ${item.imdbRating}",
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
