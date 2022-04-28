import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:week_10_moviedb/data/api_provider.dart';
import 'package:week_10_moviedb/model/popular_movies.dart';
import 'package:week_10_moviedb/model/result.dart';

void main() => runApp(const MoviesApp());

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var apiProvider = ApiProvider();
  var imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: FutureBuilder<PopularMovies>(
          future: apiProvider.getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data!.results[index];
                  return moviesItem(
                      poster: '$imageBaseUrl${movie.posterPath}',
                      title: movie.title,
                      date: movie.releaseDate,
                      voteAverage: movie.voteAverage.toString(),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(movie: movie),
                          ),
                        );
                      });
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget moviesItem({
  required String poster,
  required String title,
  required String date,
  required String voteAverage,
  required Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: CachedNetworkImage(
                imageUrl: poster,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(date)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(voteAverage)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class MovieDetail extends StatelessWidget {
  final Result movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Text(movie.overview),
    );
  }
}
