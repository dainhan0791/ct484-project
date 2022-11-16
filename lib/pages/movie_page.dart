import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/movie_page_button_component.dart';
import 'package:flutter_application_b1909960/components/recomment_component.dart';
import 'package:flutter_application_b1909960/models/current_movie.dart';
import 'package:flutter_application_b1909960/models/movie.dart';
import 'package:flutter_application_b1909960/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CurrentMovie;
    final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance
        .collection('movies')
        .where('id', isEqualTo: args.id)
        .snapshots();

    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _movieStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Stack(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Image.network(
                      data['image'],
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      provider.toggleFavorite(
                                        Movie(
                                          id: data['id'],
                                          title: data['title'],
                                          description: data['description'],
                                          year: data['year'],
                                          star: data['star'],
                                          genre: data['genre'],
                                          image: data['image'],
                                          video: data['video'],
                                        ),
                                      );
                                      // provider.toggleFavorite({
                                      //   'id': data['id'].toString(),
                                      //   'title': data['title'].toString(),
                                      //   'genre': data['genre'].toString(),
                                      //   'image': data['image'].toString(),
                                      // });
                                    },
                                    child: provider.isExist(
                                      Movie(
                                        id: data['id'],
                                        title: data['title'],
                                        description: data['description'],
                                        year: data['year'],
                                        star: data['star'],
                                        genre: data['genre'],
                                        image: data['image'],
                                        video: data['video'],
                                      ),
                                    )
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 8,
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      data['image'],
                                      height: 240,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    right: 50,
                                    top: 50,
                                  ),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 8,
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, 'videoPage',
                                          arguments: CurrentMovie(args.id));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const MoviePageButtonComponent(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  data['description'],
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 123, 183, 233),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          const RecommenComponent(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: const CustomNavbarComponent(),
    );
  }
}
