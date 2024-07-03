import 'package:flutter/material.dart';
import 'package:moviess/moviedetailpage.dart';
import 'package:moviess/movieprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Finder'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              // showSortMenu(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: movieProvider.searchController,
              onChanged: (query) {
                if (query.isNotEmpty) {
                  movieProvider.searchMovies(query);
                } else {
                  movieProvider.fetchMovies();
                }
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: movieProvider.searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          movieProvider.clearSearch();
                        },
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.movies[index];
                return ListTile(
                  title: Text(movie.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // void showSortMenu(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Consumer<MovieProvider>(
  //         builder: (context, movieProvider, _) => Container(
  //           child: Wrap(
  //             children: <Widget>[
  //               ListTile(
  //                 leading: Icon(Icons.sort_by_alpha),
  //                 title: Text('Sort by Year'),
  //                 onTap: () {
  //                   movieProvider.sortMoviesByYear();
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               ListTile(
  //                 leading: Icon(Icons.sort_by_alpha),
  //                 title: Text('Sort by Director'),
  //                 onTap: () {
  //                   movieProvider.sortMoviesByDirector();
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
