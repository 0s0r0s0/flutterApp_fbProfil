import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fb_template_exo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue)),
      home: const BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "lib/images/slove (2).jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 125),
                  child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: myProfilePic(72)),
                )
              ],
            ),
            const Row(children: [
              Spacer(),
              Text("Cédric Dev66",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              Spacer(),
            ]),
            const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Développeur Flutter, inventeur de la boulette au coeur de mozza et mari de la plus belle des amoureuses",
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                )),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            sectionTitleText("A propos de moi"),
            aboutRow(icon: Icons.house, text: "Sophia-Antipolis"),
            aboutRow(icon: Icons.work, text: "Développeur Flutter"),
            aboutRow(icon: Icons.favorite, text: "Vive la tartiflette"),
            const Divider(
              thickness: 2,
            ),
            sectionTitleText("Amis"),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                friendsImage("Nouko", "lib/images/fox.jpg", width / 3.5),
                friendsImage("Kakao", "lib/images/polarbear.jpg", width / 3.5),
                friendsImage("Marco", "lib/images/koala.jpg", width / 3.5)
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            sectionTitleText("Posts"),
            post(
                time: "5 minutes",
                image: "lib/images/van.jpg",
                desc: "Premier arrêt au bord d'un ravin"),
            post(
                time: "6 heures",
                image: "lib/images/parking.jpg",
                desc: "Le prix du parking est beaucoup trop cher #coPark",
                likes: 55,
                comments: 1),
            post(
                time: "1 jour",
                image: "lib/images/road.jpg",
                desc: "Attachez vos ceintures, en route pour l'aventure",
                likes: 85,
                comments: 3),
            post(
                time: "2 jours",
                image: "lib/images/nissan.jpg",
                desc: "Il est tout beau tout propre mon nouveau van !!",
                likes: 142,
                comments: 12),
          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage("lib/images/ours.jpg"),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
       height: 50,
      child: (icon == null)
          ? Center(
              child: Text(
              text ?? "",
              style: const TextStyle(color: Colors.white),
            ))
          : Icon(
              icon,
              color: Colors.white,
            ),
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.grey)]),
        ),
        Text(name),
        const Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

  Container post(
      {required String time,
      required String image,
      required String desc,
      int likes = 0,
      int comments = 0}) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilePic(20),
              const Padding(padding: EdgeInsets.only(left: 8)),
              const Text("Cédric Dév66"),
              const Spacer(),
              timeText(time)
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(image, fit: BoxFit.cover)),
          Text(
            desc,
            style: const TextStyle(color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.favorite),
              Text("$likes Likes"),
              const Icon(Icons.message),
              Text("$comments Commentaires")
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text(
      "Il y a $time",
      style: const TextStyle(color: Colors.blue),
    );
  }
}
