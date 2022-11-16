import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/header_component.dart';
import 'package:flutter_application_b1909960/components/new_movies_component.dart';
import 'package:flutter_application_b1909960/components/upcoming_component.dart';
import 'package:flutter_application_b1909960/pages/category_page.dart';
import 'package:flutter_application_b1909960/pages/favorite_page.dart';
import 'package:flutter_application_b1909960/pages/movie_page.dart';
import 'package:flutter_application_b1909960/pages/user_page.dart';
import 'package:flutter_application_b1909960/pages/video_page.dart';
import 'package:flutter_application_b1909960/provider/favorite_provider.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  //  Theme & Fonts
  ThemeData _buildTheme() {
    var baseTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF0F111F),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.aBeeZeeTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(),
        home: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 10,
                    ),
                    child: const HeaderComponent(),
                  ),
                  Container(
                    height: 56,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF292B37),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.white54,
                          size: 30,
                        ),
                        Container(
                          width: 300,
                          margin: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const UpcomingComponent(),
                  const SizedBox(
                    height: 20,
                  ),
                  const NewMoviesComponent(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomNavbarComponent(),
        ),
        routes: {
          "categoryPage": (context) => const CategoryPage(),
          "moviePage": (context) => const MoviePage(),
          "userPage": (context) => const UserPage(),
          "favoritePage": (context) => const FavoritePage(),
          "videoPage": (context) => const VideoPage(),
        },
      ),
    );
  }
}
