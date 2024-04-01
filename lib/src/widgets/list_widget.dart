import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_piece_list/src/pages/detail_page.dart';

class characterList extends StatefulWidget {
  const characterList({super.key});

  @override
  State<characterList> createState() => _characterListState();
}

class _characterListState extends State<characterList> {
  double screenWidth = 0;
  final titleTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width - 50;
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Portada",
            style: titleTextStyle,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              blocksCover("p1.jpg", "Portada 1: ", "2018"),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              blocksCover("p2.jpg", "Portada 2: ", "2022"),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              blocksCover("p3.jpg", "Portada 3: ", "2023")
            ],
          ),
          //Linea divisora
          const Divider(
            thickness: 1,
            height: 60,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          characterBlock("Brook", 0xff4913c4, "o1"),
          characterBlock("Luffy", 0xfff82a2d, "o2"),
          characterBlock("Porgas D. Ace", 0xffffcb28, "o3"),
          characterBlock("Boa Hancock", 0xfffe4649, "o4"),
          characterBlock("Boa Hancock", 0xffdf1c6a, "o5"),
          characterBlock("Roronoa Zoro", 0xff21e295, "o6"),
        ],
      ),
    );
  }

  Widget characterBlock(String name, int color, String img) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: ((context) => DetailPage(
                  color: color,
                  img: img,
                  name: name,
                ))))
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(129, 43, 43, 43)),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                        spreadRadius: 0.0,
                        blurStyle: BlurStyle.normal,
                        color: Color(color),
                      )
                    ], borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(8),
                    //El tag debe tener el mismo nombre en el origin como en la llegada
                    child: Hero(tag: color, child: Image.asset("assets/$img.png")),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey,
                  ))
            ],
          )),
    );
  }

  Widget blocksCover(String image, String title, String caption) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            //se multiplica para que el 100% se distribuya 31% cada una
            width: screenWidth * 0.31,
            height: 110,
            //Fit:BoxFit.cover se usa para hacer un zoon y adaptar al contenedor sin dañar la img
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
            text: TextSpan(
                text: title,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                children: [
              TextSpan(
                  text: caption,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ]))
      ],
    );
  }
}
