import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/movie_page_button_component.dart';
import 'package:flutter_application_b1909960/components/recomment_component.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              "images/godzilla_kong.jpg",
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
                    padding: EdgeInsets.symmetric(
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
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                            child: Image.asset(
                              "images/godzilla_kong.jpg",
                              height: 240,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
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
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    ),
                  ),
                  MoviePageButtonComponent(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Godzilla vs Kong",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "This is the sample description of the movie This is the sample description of the movie This is the sample description of the movie This is the sample description of the movie",
                          style: TextStyle(
                            color: Color.fromARGB(255, 123, 183, 233),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RecommenComponent(),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavbarComponent(),
    );
  }
}
