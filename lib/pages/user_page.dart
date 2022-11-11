// import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_b1909960/services/movie_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final User? user = AuthService().currentUser;
  String? successMessage;
  String? errorMessage;

  final TextEditingController _controllerId = TextEditingController();
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerYear = TextEditingController();
  final TextEditingController _controllerStar = TextEditingController();
  final TextEditingController _controllerGenre = TextEditingController();
  final TextEditingController _controllerImage = TextEditingController();
  final TextEditingController _controllerVideo = TextEditingController();

  // get value
  get title => _controllerTitle;
  get id => _controllerId;

  // Widgets
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

  Widget _movieTitleFiled(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        'Movie ${title.toString()} :',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _movieField(
    String title,
    TextEditingController _controller,
  ) {
    return Container(
      height: 48,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.blue[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: title == 'id'
              ? Icon(Icons.key, color: Colors.red.withOpacity(0.8))
              : title == 'title'
                  ? Icon(Icons.title, color: Colors.red.withOpacity(0.8))
                  : title == 'description'
                      ? Icon(Icons.description,
                          color: Colors.red.withOpacity(0.8))
                      : title == 'genre'
                          ? Icon(Icons.catching_pokemon,
                              color: Colors.red.withOpacity(0.8))
                          : title == 'star'
                              ? Icon(Icons.star,
                                  color: Colors.red.withOpacity(0.8))
                              : title == 'image'
                                  ? Icon(Icons.image,
                                      color: Colors.red.withOpacity(0.8))
                                  : title == 'video'
                                      ? Icon(Icons.movie_filter,
                                          color: Colors.red.withOpacity(0.8))
                                      : title == 'year'
                                          ? Icon(Icons.timer,
                                              color:
                                                  Colors.red.withOpacity(0.8))
                                          : Icon(Icons.replay_outlined,
                                              color:
                                                  Colors.red.withOpacity(0.8)),
        ),
      ),
    );
  }

  Widget _helloUser() {
    return Text(
      '${user?.email} ❤️',
      // user?.email?.replaceAll('@gmail.com', '') ?? 'User does not exist',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // Function
  Future<void> signOut() async {
    await AuthService().signOut();
  }

  reloadInputValues() async {
    _controllerId.clear();
    _controllerTitle.clear();
    _controllerDescription.clear();
    _controllerYear.clear();
    _controllerGenre.clear();
    _controllerStar.clear();
    _controllerImage.clear();
    _controllerVideo.clear();

    setState(() {
      successMessage = 'Clear All Input Values Successfully';
    });
  }

  Future<void> addMovie() async {
    try {
      if (_controllerId.text == '' ||
          _controllerTitle.text == '' ||
          _controllerDescription.text == '' ||
          _controllerYear.text == '' ||
          _controllerStar.text == '' ||
          _controllerImage.text == '' ||
          _controllerVideo.text == '') {
        setState(() {
          errorMessage = 'Movie Input is not empty';
        });
      } else {
        setState(() {
          successMessage = 'Add Movie Sucessfully with title: ${title.text}';
        });
        await MovieService().addMovie(
          id: _controllerId.text,
          title: _controllerTitle.text,
          description: _controllerDescription.text,
          year: _controllerYear.text,
          star: _controllerStar.text,
          genre: _controllerGenre.text,
          image: _controllerImage.text,
          video: _controllerVideo.text,
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> updateMovie() async {
    try {
      if (_controllerId.text == '') {
        errorMessage = 'Movie Id is not empty';
      } else {
        setState(() {
          successMessage = 'Update Movie Sucessfully with id: ${id.text}';
        });
        await MovieService().updateMovie(
          id: _controllerId.text,
          title: _controllerTitle.text,
          description: _controllerDescription.text,
          year: _controllerYear.text,
          star: _controllerStar.text,
          genre: _controllerGenre.text,
          image: _controllerImage.text,
          video: _controllerVideo.text,
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> deleteMovie() async {
    try {
      if (_controllerId.text == '') {
        errorMessage = 'Movie Id is not empty';
      } else {
        setState(() {
          successMessage = 'Delete Movie Sucessfully with id: ${id.text}';
        });
        await MovieService().deleteMovie(
          id: _controllerId.text,
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
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
                          '${user?.email?.replaceFirst('@gmail.com', '')} Aministrator',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "images/kenji.jpg",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    // Container(
                    //   width: 50,
                    //   height: 50,
                    //   child: Avatar(
                    //     name: '${user?.email?[0].toUpperCase()}',
                    //     backgroundColor: Colors.brown.shade800,
                    //     textStyle: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //     onTap: () {},
                    //   ),
                    // )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _movieTitleFiled('id'),
                    _movieField('id', _controllerId),
                    _sizedBox(6),
                    _movieTitleFiled('title'),
                    _movieField('title', _controllerTitle),
                    _sizedBox(6),
                    _movieTitleFiled('desciption'),
                    _movieField('desciption', _controllerDescription),
                    _sizedBox(6),
                    _movieTitleFiled('year'),
                    _movieField('year', _controllerYear),
                    _sizedBox(6),
                    _movieTitleFiled('genre'),
                    _movieField('genre', _controllerGenre),
                    _sizedBox(6),
                    _movieTitleFiled('star'),
                    _movieField('star', _controllerStar),
                    _sizedBox(6),
                    _movieTitleFiled('image'),
                    _movieField('image', _controllerImage),
                    _sizedBox(6),
                    _movieTitleFiled('video'),
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
                                errorMessage != null
                                    ? errorMessage.toString()
                                    : successMessage.toString(),
                                style: TextStyle(
                                  color: errorMessage != null
                                      ? Colors.red
                                      : Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                          setState(() {
                            if (errorMessage != null) {
                              errorMessage = null;
                            }
                            if (successMessage != null) {
                              successMessage = null;
                            }
                          });
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
                        onTap: () {
                          updateMovie();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(
                                errorMessage != null
                                    ? errorMessage.toString()
                                    : successMessage.toString(),
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
                          setState(() {
                            if (errorMessage != null) {
                              errorMessage = null;
                            }
                            if (successMessage != null) {
                              successMessage = null;
                            }
                          });
                        },
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
                        onTap: () {
                          deleteMovie();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.yellow.withOpacity(0.8),
                              content: Text(
                                errorMessage != null
                                    ? errorMessage.toString()
                                    : successMessage.toString(),
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
                          setState(() {
                            if (errorMessage != null) {
                              errorMessage = null;
                            }
                            if (successMessage != null) {
                              successMessage = null;
                            }
                          });
                        },
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
                          reloadInputValues();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white.withOpacity(0.8),
                              content: Text(
                                successMessage.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                          setState(() {
                            successMessage = null;
                          });
                        },
                        child: Icon(
                          Icons.clear_all,
                          size: 26,
                          color: Colors.white,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbarComponent(),
    );
  }
}
