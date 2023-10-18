// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moviereview/favmovies.dart';
import 'package:moviereview/movieitems.dart';
import 'package:fsearch/fsearch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController? searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  List<MovieItem> movieItems = [
    MovieItem(
      imagePath: 'assets/images/jawan.png',
      movieName: 'Jawan',
      releaseYear: '2023',
      imdbRating: '7.5',
      popularity: '90',
    ),
    MovieItem(
      imagePath: 'assets/images/jailer.jpeg',
      movieName: 'Jailer',
      releaseYear: '2023',
      imdbRating: '7.1',
      popularity: '85%',
    ),

    MovieItem(
      imagePath: 'assets/images/bluebeetle.jpg',
      movieName: 'Bluebeetle',
      releaseYear: '2023',
      imdbRating: '6.1',
      popularity: '75%',
    ),

    MovieItem(
      imagePath: 'assets/images/thankyou.jpg',
      movieName: 'Thankyou',
      releaseYear: '2022',
      imdbRating: '6.0',
      popularity: '73%',
    ),

    MovieItem(
      imagePath: 'assets/images/gadar2.jpg',
      movieName: 'Gadar 2',
      releaseYear: '2023',
      imdbRating: '5.4',
      popularity: '68%',
    ),
    MovieItem(
      imagePath: 'assets/images/evil-dead-rise.jpg',
      movieName: 'Evil Dead Rise',
      releaseYear: '2023',
      imdbRating: '6.6',
      popularity: '75%',
    ),
    
  ];

  String filterOption = '';
  bool isFilterVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    movieItems = List.from(movieItems);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

     
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          List<MovieItem> newMovies = [
            MovieItem(
              imagePath: 'assets/images/blackadam.jpg',
              movieName: 'Blackadam',
              releaseYear: '2022',
              imdbRating: '6.3',
              popularity: '77%',
            ),
            MovieItem(
              imagePath: 'assets/images/vikram.jpg',
              movieName: 'Vikram',
              releaseYear: '2022',
              imdbRating: '8.3',
              popularity: '95%',
            ),
            MovieItem(
              imagePath: 'assets/images/maaveeran.jpg',
              movieName: 'Maaveeran',
              releaseYear: '2023',
              imdbRating: '7.4',
              popularity: '82%',
            ),
            MovieItem(
              imagePath: 'assets/images/kingofkotha.jpg',
              movieName: 'King of Kotha',
              releaseYear: '2023',
              imdbRating: '6.1',
              popularity: '70%',
            ),
            MovieItem(
              imagePath: 'assets/images/kushi.jpg',
              movieName: 'Kushi',
              releaseYear: '2023',
              imdbRating: '5.5',
              popularity: '76%',
            ),
            MovieItem(
              imagePath: 'assets/images/insidious.jpg',
              movieName: 'Insidious',
              releaseYear: '2023',
              imdbRating: '5.5',
              popularity: '72%',
            ),
            MovieItem(
              imagePath: 'assets/images/Dasara.jpg',
              movieName: 'Dasara',
              releaseYear: '2023',
              imdbRating: '6.7',
              popularity: '80%',
            ),
          ];

       
          movieItems.addAll(newMovies);

          isLoading = false;
        });
      });
    }
  }

  void _onSearch(String searchText) {
    setState(() {
      movieItems = movieItems
          .where((movie) =>
              movie.movieName.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchBoxWidth = screenWidth * 0.7;
    final fontSize = screenWidth * 0.035;
    final iconSize = screenWidth * 0.086;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenWidth * 0.06,
                left: screenWidth * 0.05,
                bottom: screenWidth * 0.03,
              ),
              child: Row(
                children: [
                  Container(
                    width: searchBoxWidth,
                    child: FSearch(
                      onSearch: _onSearch,
                      height: screenWidth * 0.086,
                      width: searchBoxWidth,
                      backgroundColor: Colors.white,
                      corner: FSearchCorner.all(screenWidth * 0.04),
                      prefixes: [Icon(Icons.search)],
                      shadowColor: Colors.blue[300],
                      shadowBlur: screenWidth * 0.01,
                      shadowOffset:
                          Offset(screenWidth * 0.01, screenWidth * 0.01),
                      hints: ["Jawan", "Kushi", "Bluebeetle"],
                      hintSwitchEnable: true,
                      hintSwitchType: FSearchAnimationType.Fade,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFilterVisible = !isFilterVisible;
                      });
                    },
                    child: Icon(
                      Icons.movie_filter_sharp,
                      color: Colors.blue[400],
                      size: iconSize,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritePage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.favorite_outlined,
                      color: Colors.blue[400],
                      size: iconSize,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isFilterVisible,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: Text(
                      "Filter by: ",
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                    ),
                  ),
                  DropdownButton<String>(
                    value: filterOption,
                    items: [
                      DropdownMenuItem<String>(
                        value: '',
                        child: Text("None"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'year',
                        child: Text("Year"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'imdb',
                        child: Text("IMDB Rating"),
                      ),
                      DropdownMenuItem<String>(
                        value: 'popularity',
                        child: Text("Popularity"),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        filterOption = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: _getFilteredMovies(),
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getFilteredMovies() {
    if (filterOption == 'year') {
      movieItems.sort((a, b) => b.releaseYear.compareTo(a.releaseYear));
    } else if (filterOption == 'imdb') {
      movieItems.sort((a, b) =>
          double.parse(b.imdbRating).compareTo(double.parse(a.imdbRating)));
    } else if (filterOption == 'popularity') {
      movieItems.sort((a, b) => b.popularity.compareTo(a.popularity));
    } else {
      movieItems.sort((a, b) => b.releaseYear.compareTo(a.releaseYear));
    }
    return movieItems.map((movieItem) {
      return MovieItem(
        imagePath: movieItem.imagePath,
        movieName: movieItem.movieName,
        releaseYear: movieItem.releaseYear,
        imdbRating: movieItem.imdbRating,
        popularity: movieItem.popularity,
      );
    }).toList();
  }
}
