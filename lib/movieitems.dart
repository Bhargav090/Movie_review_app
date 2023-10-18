import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class MovieItem extends StatefulWidget {
  final String imagePath;
  final String movieName;
  final String releaseYear;
  final String imdbRating;
  final String popularity;

  MovieItem({
    required this.imagePath,
    required this.movieName,
    required this.releaseYear,
    required this.imdbRating,
    required this.popularity,
  });
  static List<MovieItem> favoriteMovies = [];

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 0.31;
    final fontSize = screenWidth * 0.04;
    final iconSize = screenWidth * 0.045;
    final padding = screenWidth * 0.02;

    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  children: [
                    Image.asset(
                      widget.imagePath,
                      height: imageHeight,
                      width: imageHeight * 2.2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GlowText(
                      widget.movieName,
                      style: TextStyle(
                          fontSize: fontSize, color: Colors.redAccent),
                    ),
                    SizedBox(
                      height: padding * 0.5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                      ),
                      padding: EdgeInsets.all(padding * 0.5),
                      child: Column(
                        children: [
                          GlowText(
                            widget.releaseYear,
                            style: TextStyle(
                                fontSize: fontSize * 0.9,
                                color: Colors.amber[300]),
                          ),
                          SizedBox(height: padding * 0.5),
                          GlowText(
                            'IMDB: ${widget.imdbRating}',
                            style: TextStyle(
                                fontSize: fontSize * 0.9,
                                color: Colors.amber[300]),
                          ),
                          SizedBox(height: padding * 0.5),
                          GlowText(
                            'Popularity: ${widget.popularity}',
                            style: TextStyle(
                                fontSize: fontSize * 0.9,
                                color: Colors.amber[300]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: padding),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;

                          if (isFavorite) {
                            MovieItem.favoriteMovies.add(widget);
                          } else {
                            MovieItem.favoriteMovies.remove(widget);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFavorite ? Colors.red : Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        padding: EdgeInsets.all(padding * 0.7),
                        child: Icon(
                          size: iconSize,
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_rounded,
                          color: isFavorite ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
