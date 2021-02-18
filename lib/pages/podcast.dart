import 'package:covid19/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Podcast extends StatefulWidget {
  @override
  _PodcastState createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.surround_sound),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Podcast',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            MyPodcast(
                title: 'How To Talk To Your Kids About The Coronavirus',
                link:
                    'https://assets.rumsan.com/askbhunte/assets/child-psychologist-coronavirus.mp3',
                summary:
                    'Here & Now\'s Jeremy Hobson talks to Janine Domingues, clinical psychologist in the Anxiety Disorders Center at the Child Mind Institute, about how to talk to kids about what\'s going on and help them navigate this difficult time.'),
            MyPodcast(
                title: 'How Covid-19 attacks your body',
                link:
                    'https://dcs.megaphone.fm/VMP8656178014.mp3?key=cbb9d48b4b61e96d72c05a48fdeb28c4&source=3',
                summary:
                    'In this episode of Vox\'s Reset podcast Ed Yong from The Atlantic explains how a little spiky ball called SARS-CoV2 brought the world to its knees.'),
            MyPodcast(
                title: 'ोभिड-१९का विरामीहरू कसरि व्यवस्थापन गरिन्छ?',
                link:
                    'https://assets.rumsan.com/askbhunte/nepalcorona/podcasts/COVID-19_PC_EP4.mp3',
                summary: 'How are COVID-19 patients managed?'),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textbox(
                    title: 'Youth Thinkers\' Society',
                    link:
                        'https://www.youtube.com/channel/UCADH-a3ZKk2cnpOOPCp2ekQ'),
                Textbox(
                    title: 'Rich Roll Podcast',
                    link: 'https://www.youtube.com/watch?v=97HiavAClUk'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textbox(
                    title: 'after COVID-19?',
                    link: 'https://www.youtube.com/watch?v=-pENRsST1WI'),
                Textbox(
                    title: 'Vaccine Does To Your Body',
                    link: 'https://www.youtube.com/watch?v=the81FQoAUI'),
              ],
            ),
          ],
        ));
  }
}
