import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/components/custom_navbar_component.dart';
import 'package:flutter_application_b1909960/models/current_movie.dart';
import 'package:flutter_application_b1909960/widget/arrow_back.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  CollectionReference users = FirebaseFirestore.instance.collection('movies');
  late YoutubePlayerController _controller;
  late final String videoUrl;
  @override
  void initState() {
    // _controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(
    //         'https://www.youtube.com/watch?v=mqqft2x_Aa4')!,
    //     flags: const YoutubePlayerFlags(
    //       autoPlay: false,
    //       mute: false,
    //     ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as CurrentMovie;
    final Stream<QuerySnapshot> _videoStream = FirebaseFirestore.instance
        .collection('movies')
        .where('id', isEqualTo: args.id)
        .snapshots();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _videoStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:
                              YoutubePlayer.convertUrlToId(data['video'])!,
                          flags: const YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: false,
                        // ignore: prefer_const_literals_to_create_immutables
                        bottomActions: [
                          const ArrowBack(),
                          ProgressBar(isExpanded: true),
                          const PlaybackSpeedButton(),
                          RemainingDuration(),
                          FullScreenButton(),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
