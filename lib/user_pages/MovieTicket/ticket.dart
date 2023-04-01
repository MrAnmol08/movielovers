import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class ChooseSeat extends StatefulWidget {
  const ChooseSeat({Key? key}) : super(key: key);

  @override
  State<ChooseSeat> createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  // var isBooked
  var countSeatLeft = 3 * 10;
  var countSeatCenter = 4 * 10;
  var countSeatRight = 3 * 10;
  var listSeatLeft = <Map<String, dynamic>>[];
  var listSeatCenter = <Map<String, dynamic>>[];
  var listSeatRight = <Map<String, dynamic>>[];

  @override
  void initState() {
    //l for left, c for center , r for right
    //first param "listSeatLeft","listSeatCenter","listSeatRight" that similar like object temp that u want to save the data
    // second param is for like how many seat on every side
    // third param is for naming value every seat //look line 38
    initSeatValueToList(listSeatLeft, countSeatLeft, "l");
    initSeatValueToList(listSeatCenter, countSeatCenter, "c");
    initSeatValueToList(listSeatRight, countSeatRight, "r");
    setVisiblitySeat();
    super.initState();
  }

  initSeatValueToList(List<Map<String, dynamic>> data, int count, String side) {
    //init variable to save your object data
    for (int i = 0; i < count; i++) {
      final objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };
      //this format object for every seat has
      // setState(() {
      data.add(objectData);
      //add object to list
      // });
    }
    // print(data);
  }

  setVisiblitySeat() {
    setState(() {
      listSeatLeft[0]["isVisible"] = false; // left column index 0
      listSeatLeft[1]["isVisible"] = false; // left column index 1
      listSeatLeft[3]["isVisible"] = false; // left column index 0
      listSeatRight[1]["isVisible"] = false; // right column index 1
      listSeatRight[2]["isVisible"] = false; // right column index 2
      listSeatRight[5]["isVisible"] = false; // right column index 5
    });
    //this function to set where's the position of the seat that should be invisible
  }

  void setSelectedToBooked() {
    for (final seat in listSeatLeft) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (final seat in listSeatCenter) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (final seat in listSeatRight) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    //this function to loop every side of seat, from selected to booked, u also can this function to send to u'r serves side
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed:(){}, icon:const  Icon(Ionicons.arrow_back_sharp), color:const Color.fromARGB(255, 54, 63, 96), ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          // ignore: prefer_const_constructors
          preferredSize: Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),

        title: Text(
          'Ticket',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: const Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
      ),
      //backgroundColor: Colors.purple,

      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  // ignore: sized_box_for_whitespace
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/lord.jpg',
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        // MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                child: Text(
                  "Front Screen",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: const Color.fromARGB(255, 54, 63, 96),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 166, 41, 41),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Booked",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 54, 63, 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 29, 161, 56),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Selected",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 54, 63, 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(255, 166, 41, 41),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "available",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 54, 63, 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widgetSeat(listSeatLeft, false),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: widgetSeat(listSeatCenter, true),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    widgetSeat(listSeatRight, false),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    setSelectedToBooked();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 122, 37, 112)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(150, 50)),
                  ),
                  child: Text(
                    'Book',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 248, 245, 245),
                    ),
                  )),
              // ElevatedButton(
              //   onPressed: () {
              //     setSelectedToBooked();
              //   },
              //   child: const Text("Booking"),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetSeat(List dataSeat, bool isCenter) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isCenter ? 4 : 3,
          childAspectRatio: isCenter ? 1 : 1,
        ),
        itemCount: dataSeat.length,
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: dataSeat[index]["isVisible"],
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dataSeat[index]["isSelected"] =
                      !dataSeat[index]["isSelected"];
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: dataSeat[index]["isBooked"]
                      ? Colors.grey
                      : dataSeat[index]["isSelected"]
                          ? const Color.fromARGB(255, 29, 161, 56)
                          : Colors.transparent,
                  border: Border.all(
                    color: const Color.fromARGB(255, 166, 41, 41),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
