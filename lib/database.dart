import 'package:flutter/material.dart';

class Song {
  final String name;
  final String singer;
  final String image;
  final int duration;
  final Color color;
  Song(
      {required this.name,
      required this.singer,
      required this.image,
      required this.duration,
      required this.color});
}

List<Song> mostPopular = [
  Song(
      name: "Hari Merdeka",
      image: "assets/song1.webp",
      singer: "Husein Mutahar",
      duration: 300,
      color: Colors.grey),
  Song(
      name: "Indonesia Raya",
      image: "assets/song2.jpeg",
      singer: "W.R. Supratman",
      duration: 252,
      color: Colors.red),
  Song(
      name: "Garuda Pancasila",
      image: "assets/song3.jpeg",
      singer: "Prohar Sudharnoto",
      duration: 532,
      color: Colors.orange),
  Song(
      name: "Tanah Airku",
      image: "assets/song4.jpeg",
      singer: "Ibu soed",
      duration: 264,
      color: Colors.grey)
];

List<Song> newRelease = [
  Song(
      name: "Indonesia Raya",
      image: "assets/song2.jpeg",
      singer: "W.R. Supratman",
      duration: 252,
      color: Colors.red),
  Song(
      name: "Hari Merdeka",
      image: "assets/song1.webp",
      singer: "Husein Mutahar",
      duration: 300,
      color: Colors.grey),
  Song(
      name: "Tanah Airku",
      image: "assets/song4.jpeg",
      singer: "Ibu soed",
      duration: 264,
      color: Colors.grey),
  Song(
      name: "Garuda Pancasila",
      image: "assets/song3.jpeg",
      singer: "Prohar Sudharnoto",
      duration: 532,
      color: Colors.orange),
];
