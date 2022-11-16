// import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/components/header_component.dart';
import 'package:flutter_application_b1909960/components/upcoming_component.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';
import 'package:flutter_application_b1909960/services/movie_service.dart';
import 'package:flutter_application_b1909960/widget/sign_out_button.dart';
import 'package:flutter_application_b1909960/widget/thank_you.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final User? user = AuthService().currentUser;
  String? successMessage;
  String? errorMessage;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerProfilePicture =
      TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  get name => _controllerName.text;
  get profiePicture => _controllerProfilePicture.text;

  // ignore: unused_element
  Widget _sizedBox(double h) {
    return SizedBox(height: h);
  }

  Widget _movieTitleFiled(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        'User ${title.toString()} :',
        style: const TextStyle(
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
          prefixIcon: title == 'name'
              ? Icon(Icons.title, color: Colors.red.withOpacity(0.8))
              : title == 'password'
                  ? Icon(Icons.key_off, color: Colors.red.withOpacity(0.8))
                  : title == 'profilePicture'
                      ? Icon(Icons.picture_as_pdf,
                          color: Colors.red.withOpacity(0.8)) 
                          : const Icon(Icons.no_luggage_outlined)
                      
        ),
      ),
    );
  }

  // Function

  Future<void> updateDisplayname() async {
    if (_controllerName.text == '') {
      setState(() {
        errorMessage = "User name is not empty";
      });
    } else {
      setState(() {
        successMessage =
            'Update ${user?.email.toString()} With Username: ${name.toString()} ';
      });
      await AuthService().updateDisplayname(name: _controllerName.text);
    }
  }

  Future<void> updateProfilePicture() async {
    if (_controllerProfilePicture.text == '') {
      setState(() {
        errorMessage = "Profile Picture Url is not empty";
      });
    } else {
      setState(() {
        successMessage =
            'Update ${user?.email.toString()} With ProfilePicture: ${profiePicture.toString()} ';
      });
      await AuthService()
          .updatePhotoURL(profileUrl: _controllerProfilePicture.text);
    }
  }

  Future<void> updatePassword() async {
    if (_controllerPassword.text == '') {
      setState(() {
        errorMessage = 'Password Input is not empty';
      });
    } else {
      setState(() {
        successMessage =
            'Update Password for ${user?.email.toString()} successfully ';
      });
      await AuthService().resetPassword(password: _controllerPassword.text);
    }
  }

  Future<void> deleteUser() async {
    try {
      await AuthService().deleteUser();
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  clearUsernameInput() {
    _controllerName.clear();
  }

  clearProfilePictureInput() {
    _controllerProfilePicture.clear();
  }

  clearPasswordInput() {
    _controllerPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            const HeaderComponent(),
            _sizedBox(30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _movieTitleFiled('name'),
                        SizedBox(
                          width: 240,
                          child: _movieField('name', _controllerName),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          updateDisplayname();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.lightBlue,
                              content: Text(
                                errorMessage != null
                                    ? errorMessage.toString()
                                    : successMessage.toString(),
                                style: TextStyle(
                                  color: errorMessage != null
                                      ? Colors.white
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
                          Icons.check,
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          clearUsernameInput();
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 26,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
                _sizedBox(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _movieTitleFiled('profilePicture'),
                        SizedBox(
                          width: 240,
                          child: _movieField(
                              'profilePicture', _controllerProfilePicture),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          updateProfilePicture();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.lightBlue,
                              content: Text(
                                errorMessage != null
                                    ? errorMessage.toString()
                                    : successMessage.toString(),
                                style: TextStyle(
                                  color: errorMessage != null
                                      ? Colors.white
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
                          Icons.check,
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          clearProfilePictureInput();
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 26,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
                _sizedBox(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _movieTitleFiled('password'),
                        SizedBox(
                          width: 240,
                          child: _movieField('password', _controllerPassword),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          updatePassword();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.lightBlue,
                              content: Text(
                                errorMessage != null
                                    ? errorMessage.toString()
                                    : successMessage.toString(),
                                style: TextStyle(
                                  color: errorMessage != null
                                      ? Colors.white
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
                          Icons.check,
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF292B37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          clearPasswordInput();
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 26,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
                _sizedBox(20),
                const SignOutButton(),
              ],
            ),
            _sizedBox(20),
            const UpcomingComponent(),
            _sizedBox(10),
            ThankYou(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavbarComponent(),
    );
  }
}
