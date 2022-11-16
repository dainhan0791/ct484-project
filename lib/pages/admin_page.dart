// import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_b1909960/components/header_component.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';
import 'package:flutter_application_b1909960/services/movie_service.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
  get description => _controllerDescription;
  get year => _controllerYear;
  get star => _controllerStar;
  get genre => _controllerGenre;
  get image => _controllerImage;
  get video => _controllerVideo;

  // Widgets

  Widget _sizedBox(double h) {
    return SizedBox(height: h);
  }

  Widget _movieTitleFiled(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        'Movie ${title.toString()} :',
        style: const TextStyle(
          color: Colors.pink,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _movieField(
    String title,
    TextEditingController _controller,
  ) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
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

  // Function
  Future<void> signOut() async {
    await AuthService().signOut();
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
        errorMessage = 'Id Movie Input Is Not Empty';
      } else {
        setState(() {
          successMessage =
              'Update Movie Successfully with id: ${id.text} & title: ${title.text} & description: ${description.text} & year: ${year.text} & genre: ${genre.text} & star: ${star.text} & image: ${image.text}  & video: ${video.text}';
        });

        if (_controllerTitle.text != '') {
          await MovieService().updateTitleMovie(
            id: _controllerId.text,
            title: _controllerTitle.text,
          );
        }

        if (_controllerDescription.text != '') {
          await MovieService().updateDescriptionMovie(
            id: _controllerId.text,
            description: _controllerDescription.text,
          );
        }
        if (_controllerYear.text != '') {
          await MovieService().updateYearMovie(
            id: _controllerId.text,
            year: _controllerYear.text,
          );
        }
        if (_controllerGenre.text != '') {
          await MovieService().updateGenreMovie(
            id: _controllerId.text,
            genre: _controllerGenre.text,
          );
        }
        if (_controllerStar.text != '') {
          await MovieService().updateStarMovie(
            id: _controllerId.text,
            star: _controllerStar.text,
          );
        }
        if (_controllerImage.text != '') {
          await MovieService().updateImageMovie(
            id: _controllerId.text,
            image: _controllerImage.text,
          );
        }
        if (_controllerVideo.text != '') {
          await MovieService().updateVideoMovie(
            id: _controllerId.text,
            video: _controllerVideo.text,
          );
        }
        if (_controllerId.text != '' &&
            _controllerTitle.text != '' &&
            _controllerDescription.text != '' &&
            _controllerYear.text != '' &&
            _controllerStar.text != '' &&
            _controllerImage.text != '' &&
            _controllerVideo.text != '') {
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
                child: const HeaderComponent(),
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
              const SizedBox(
                height: 20,
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
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
                        child: const Icon(
                          Icons.add,
                          size: 26,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
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
                        child: const Icon(
                          Icons.edit,
                          size: 26,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
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
                        child: const Icon(
                          Icons.delete,
                          size: 26,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
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
                                style: const TextStyle(
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
                        child: const Icon(
                          Icons.remove,
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          signOut();
                        },
                        child: const Icon(
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
    );
  }
}
