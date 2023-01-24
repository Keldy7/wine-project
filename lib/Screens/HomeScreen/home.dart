import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineproject/Screens/DetailsScreen/details_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<IconData> listIcons = [
    Icons.home_outlined,
    Icons.favorite_outline_outlined,
    Icons.shopping_bag_outlined,
    Icons.account_circle_outlined,
  ];

  List<Vin> Vins = [
    Vin(
        nom: "Domaine Carneros Le Reve",
        image: "assets/vin6.png",
        prix: "109,99"),
    Vin(
        nom: "Bellavista Rose Franciacorta",
        image: "assets/vin2.png",
        prix: "44,99"),
    Vin(nom: "L'Ermitage Brut Rose", image: "assets/vin5.png", prix: "149"),
    Vin(nom: "Valpierre", image: "assets/vin3.png", prix: "149,99"),
    Vin(nom: "RLG", image: "assets/vin4.png", prix: "109,98"),
  ];

  Widget _categories({required String nomCat}) {
    return Container(
      height: 30,
      width: 60,
      margin: const EdgeInsets.only(left: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          nomCat,
          style: GoogleFonts.poppins(
              color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "What Would You Like?",
                style: GoogleFonts.bodoniModa(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              height: size.height * 0.09,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: "Search",
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade600,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 242, 242),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Customer`s Choice",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromARGB(255, 78, 19, 31),
                                    ),
                                  ),
                                  Text(
                                    "Ferghettina Rose 'Eronero'",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        "\$30.99",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 78, 19, 31),
                                        ),
                                      ),
                                      Text(
                                        " /0,2 gal",
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 179,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/wineHome.png")),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  )
                ]),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _categories(nomCat: "Red"),
                            _categories(nomCat: "White"),
                            _categories(nomCat: "Rose"),
                            _categories(nomCat: "Sparkle"),
                            _categories(nomCat: "Fortified"),
                          ],
                        )),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              //margin: const EdgeInsets.only(left:2),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: Vins.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.77),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 3),
                      margin: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: const Color.fromARGB(255, 249, 209, 209),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DetailsScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            elevation: 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Spacer(),
                                Icon(
                                  Icons.favorite_border,
                                  color: Color.fromARGB(255, 78, 19, 31),
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const DetailsScreen()));
                                },
                                child: Container(
                                  child: Image.asset(
                                    Vins[index].image,
                                    height: 130,
                                    width: 150,
                                  ),
                                )),
                            Container(
                              padding: const EdgeInsets.only(bottom: 1),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Vins[index].nom,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${Vins[index].prix}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        " + ",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 78, 19, 31),
            child: Container(
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: listIcons.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      //height: index == selectedIndex ? 6 : 45,
                      width: 35,
                      decoration: BoxDecoration(
                        //borderRadius: const BorderRadius.all(Radius.circular(500))
                        border: i == selectedIndex
                            ? const Border(
                                bottom:
                                    BorderSide(width: 3.0, color: Colors.white))
                            : null,
                      ),
                      child: Icon(
                        listIcons[i],
                        size: 30,
                        color: Colors.white,
                        // color: i == selectedIndex
                        //     ? Colors.white
                        //     : Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ));
  }
}

class Vin {
  final String nom;
  final String image;
  final String prix;

  Vin({
    required this.nom,
    required this.image,
    required this.prix,
  });
}
