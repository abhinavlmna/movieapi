import 'package:flutter/material.dart';
import 'package:moviess/moviemodel.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? 'No Title'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  movie.poster ?? '',
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                movie.title ?? 'No Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Release Year: ${movie.year ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Genre: ${movie.genre?.join(', ') ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Director: ${movie.director ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Cast: ${movie.cast?.join(', ') ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Rating: ${movie.rating?.toString() ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              // SizedBox(height: 8),
              // Text(
              //   'Duration: ${movie.duration?.toString() ?? 'N/A'} minutes',
              //   style: TextStyle(fontSize: 16),
              // ),
              SizedBox(height: 8),
              Text(
                'Language: ${movie.language ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Country: ${movie.country ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              // SizedBox(height: 8),
              // Text(
              //   'Synopsis: ${movie.synopsis ?? 'N/A'}',
              //   style: TextStyle(fontSize: 16),
              // ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement trailer play logic
                },
                child: Text('Watch Trailer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
