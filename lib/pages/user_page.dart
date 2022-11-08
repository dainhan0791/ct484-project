import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/movie_page_button_component.dart';
import 'package:flutter_application_b1909960/components/recomment_component.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_b1909960/services/movie_service.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final User? user = AuthService().currentUser;
  String? successMessage = '';
  String? errorMessage = '';

  final TextEditingController _controllerId = TextEditingController();
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerStar = TextEditingController();
  final TextEditingController _controllerGenre = TextEditingController();
  final TextEditingController _controllerImage = TextEditingController();
  final TextEditingController _controllerVideo = TextEditingController();

  get title => _controllerTitle;

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  Widget _userUid() {
    return Text(
      user?.email ?? 'User does not exist',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  Widget _sizedBox(double h) {
    return SizedBox(height: h);
  }

  Widget _movieField(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      height: 48,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          filled: true,
          fillColor: Colors.blue.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Function
  Future<void> addMovie() async {
    try {
      await MovieService().addMovie(
        id: _controllerId.text,
        title: _controllerTitle.text,
        description: _controllerDescription.text,
        star: _controllerStar.text,
        genre: _controllerGenre.text,
        image: _controllerImage.text,
        video: _controllerVideo.text,
      );
      setState(() {
        successMessage = 'Add Movie Sucessfully with title: ${title.text}';
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                _userUid(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                _movieField('id', _controllerId),
                _sizedBox(8),
                _movieField('title', _controllerTitle),
                _sizedBox(8),
                _movieField('desciption', _controllerDescription),
                _sizedBox(8),
                _movieField('star', _controllerStar),
                _sizedBox(8),
                _movieField('genre', _controllerGenre),
                _sizedBox(8),
                _movieField('image', _controllerImage),
                _sizedBox(8),
                _movieField('video', _controllerVideo),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      addMovie();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            successMessage != null
                                ? successMessage.toString()
                                : errorMessage.toString(),
                            style: TextStyle(
                              color: successMessage != null
                                  ? Colors.white
                                  : Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      size: 26,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      size: 26,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      size: 26,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      signOut();
                    },
                    child: Icon(
                      Icons.logout,
                      size: 26,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Text(
          //   errorMessage.toString(),
          //   style: TextStyle(
          //     color: Colors.red,
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          // Text(
          //   successMessage.toString(),
          //   style: TextStyle(
          //     color: Colors.red,
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: CustomNavbarComponent(),
    );
  }
}
