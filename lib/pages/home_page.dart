import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/new_movies_component.dart';
import 'package:flutter_application_b1909960/components/upcoming_component.dart';
import 'package:flutter_application_b1909960/pages/category_page.dart';
import 'package:flutter_application_b1909960/pages/movie_page.dart';
import 'package:flutter_application_b1909960/pages/user_page.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  // Widget _title() {
  //   return const Text("Firebase Auth");
  // }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Widget _helloUser() {
    return Text(
      'Hi! ${user?.email?.replaceFirst('@gmail.com', ' ❤️')}',
      // user?.email?.replaceAll('@gmail.com', '') ?? 'User does not exist',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  ThemeData _buildTheme() {
    var baseTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF0F111F),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.aBeeZeeTextTheme(baseTheme.textTheme),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _helloUser(),
                          SizedBox(height: 5),
                          Text(
                            'What to Watch?',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "images/profile.jpg",
                          height: 56,
                          width: 56,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white54,
                        size: 30,
                      ),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
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
                SizedBox(height: 20),
                UpcomingComponent(),
                SizedBox(
                  height: 20,
                ),
                NewMoviesComponent(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavbarComponent(),
      ),
      routes: {
        "categoryPage": (context) => CategoryPage(),
        "moviePage": (context) => MoviePage(),
        "userPage": (context) => UserPage(),
      },
    );
  }
}
