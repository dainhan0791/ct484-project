import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/header_component.dart';
import 'package:flutter_application_b1909960/models/movie.dart';
import 'package:flutter_application_b1909960/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final Stream<QuerySnapshot> _favoriteMoviesStream = FirebaseFirestore.instance
      .collection('movies')
      .where('year', isEqualTo: '2021')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final movies = provider.FavoriteMovies.toList();
    // return Scaffold(
    //   body: StreamBuilder<QuerySnapshot>(
    //     stream: _favoriteMoviesStream,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return const Text('Something went wrong');
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Text("Loading");
    //       }

    //       return SingleChildScrollView(
    //         scrollDirection: Axis.vertical,
    //         child: SafeArea(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   vertical: 20,
    //                   horizontal: 15,
    //                 ),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const HeaderComponent(),
    //                     InkWell(
    //                       onTap: () {
    //                         // Togo back to the page
    //                         Navigator.pop(context);
    //                       },
    //                       child: const Icon(
    //                         Icons.arrow_back,
    //                         color: Colors.white,
    //                         size: 30,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 10,
    //                     ),
    //                     const Text(
    //                       'Favorites',
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 30,
    //                         fontWeight: FontWeight.w500,
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 15,
    //                 ),
    //                 child: Column(
    //                   children:
    //                       snapshot.movie!.docs.map((DocumentSnapshot document) {
    //                     Map<String, dynamic> movie =
    //                         document.movie()! as Map<String, dynamic>;
    //                     return Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                         vertical: 10,
    //                       ),
    //                       child: Row(
    //                         children: [
    //                           ClipRRect(
    //                             borderRadius: BorderRadius.circular(10),
    //                             child: Image.network(
    //                               movie['image'],
    //                               height: 120,
    //                               width: 90,
    //                               fit: BoxFit.cover,
    //                             ),
    //                           ),
    //                           const SizedBox(width: 10),
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               SizedBox(
    //                                 width: 220,
    //                                 child: Text(
    //                                   movie['title'],
    //                                   style: const TextStyle(
    //                                     fontSize: 18,
    //                                     color: Colors.white,
    //                                   ),
    //                                 ),
    //                               ),
    //                               const SizedBox(
    //                                 height: 10,
    //                               ),
    //                               SizedBox(
    //                                 width: 220,
    //                                 child: Text(
    //                                   movie['genre'],
    //                                   style: const TextStyle(
    //                                     fontSize: 14,
    //                                     color: Colors.amber,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           const Spacer(),
    //                           const Icon(
    //                             Icons.favorite,
    //                             color: Colors.red,
    //                             size: 36,
    //                           )
    //                         ],
    //                       ),
    //                     );
    //                   }).toList(),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    //   bottomNavigationBar: const CustomNavbarComponent(),
    // );
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderComponent(),
                InkWell(
                  onTap: () {
                    // Togo back to the page
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        movie['image'],
                                        height: 120,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 220,
                                          child: Text(
                                            movie['title'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 220,
                                          child: Text(
                                            movie['genre'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        provider.removeFavorite(index);
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 36,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavbarComponent(),
    );
  }
}
