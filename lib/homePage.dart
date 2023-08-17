import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player_ui/database.dart';
import 'package:music_player_ui/musicPlayer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        actions: const [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Idlal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Indonesia",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, left: 15),
            child: Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Colors.black,
            ),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "The Most Popular",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Special Song",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "78th Independence Day Indonesia",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                  child: Text(
                    "78 playlists",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: TrackWidget(refresh),
                ),
                CircleTrackWidget(
                  song: newRelease,
                  title: "National Anthem",
                  subtitle: "125 songs",
                  notifyParent: refresh,
                ),
                CircleTrackWidget(
                  song: mostPopular,
                  title: "Your Playlist",
                  subtitle: "346 songs",
                  notifyParent: refresh,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PlayerHome(currentSong),
          )
        ],
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}

Song currentSong = Song(
  name: "Hari Merdeka",
  singer: "Husein Mutahar",
  image: "assets/song1.webp",
  duration: 100,
  color: Colors.black,
);
double currentSlider = 0;

class PlayerHome extends StatefulWidget {
  final Song song;
  const PlayerHome(this.song, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlayerHomeState createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => MusicPlayer(widget.song),
          ),
        );
      },
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "image",
                      child: CircleAvatar(
                        backgroundImage: AssetImage(widget.song.image),
                        radius: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.song.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.song.singer,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.pause, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.skip_next_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Duration(seconds: currentSlider.toInt())
                      .toString()
                      .split('.')[0]
                      .substring(2),
                  style: const TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 4),
                      trackShape: const RectangularSliderTrackShape(),
                      trackHeight: 4,
                    ),
                    child: Slider(
                      value: currentSlider,
                      max: widget.song.duration.toDouble(),
                      min: 0,
                      inactiveColor: Colors.grey[500],
                      activeColor: Colors.white,
                      onChanged: (val) {
                        setState(() {
                          currentSlider = val;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  Duration(seconds: widget.song.duration)
                      .toString()
                      .split('.')[0]
                      .substring(2),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  final Function() notifyParent;
  const TrackWidget(this.notifyParent, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mostPopular.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            currentSong = mostPopular[index];
            currentSlider = 0;
            notifyParent();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: mostPopular[index].color,
                      blurRadius: 1,
                      spreadRadius: 0.3)
                ],
                image: DecorationImage(
                    image: AssetImage(mostPopular[index].image),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mostPopular[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            mostPopular[index].singer,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircleTrackWidget extends StatelessWidget {
  final String title;
  final List<Song> song;
  final String subtitle;
  final Function() notifyParent;

  const CircleTrackWidget({
    super.key,
    required this.title,
    required this.song,
    required this.subtitle,
    required this.notifyParent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: song.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    currentSong = song[index];
                    currentSlider = 0;
                    notifyParent();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(song[index].image),
                          radius: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          song[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          song[index].singer,
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
