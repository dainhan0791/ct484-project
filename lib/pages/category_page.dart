import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Togo back to the page
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Discover",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    for (int i = 1; i < 6; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "images/movie-$i.jpg",
                                height: 70,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 23,
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
      ),
      bottomNavigationBar: CustomNavbarComponent(),
    );
  }
}
