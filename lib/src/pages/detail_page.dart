//importM
import 'package:flutter/material.dart';
import 'package:one_piece_list/src/animations/fade_animation.dart';
import 'package:one_piece_list/src/widgets/blurContainer_widget.dart';
import 'package:one_piece_list/src/widgets/infoTitle_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key, required this.color, required this.img, required this.name});
  final int color;
  final String img;
  final String name;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double screenHeight = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(widget.color), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Se usa para superponer un elemento por encima de otro
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    //Se multiploca por la cantidad de espacio que desea que  ocupe por  pantalla en este caso el 60%
                    height: screenHeight * 0.6,
                    child: Hero(
                        tag: widget.color,
                        child: Image.asset("assets/${widget.img}.png")),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: fadeAnimation(
                      intervalEnd: 0.8,
                      child: BlurContainer(
                          child: Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.1)),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: fadeAnimation(
                intervalStart: 0.3,
                child: Text(
                  "${widget.name} #Personajes",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: fadeAnimation(
                intervalStart: 0.35,
                child: Text(
                  "One Piece",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: fadeAnimation(
                intervalStart: 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    infoTtile(title: "Eiichirō Oda", caption: "Creador"),
                    infoTtile(title: "Japon", caption: "Pais")
                  ],
                ),
              ),
            ),
            const Spacer(),
            fadeAnimation(
              intervalStart: 0.5,
              child: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(widget.color)),
                  child: const Text(
                    "Volver",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
