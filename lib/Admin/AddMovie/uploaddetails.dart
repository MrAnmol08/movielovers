import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
     final _nameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromARGB(255, 44, 54, 87),
          ),
          onPressed: () {
            Navigator.pop(context);
          } 
        ),
        title: const Text(
          'Upload Details',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 54, 87),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
             body: SingleChildScrollView(
               child: Column(
                 children: [
                  Image.asset(
                'assets/images/editdetail.png',
                height: 200,
                width: 200,
                         ),
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Movie Title',
                          fillColor: Color.fromARGB(255, 253, 253, 253),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.title,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
             
                    SizedBox(height: 15),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Movie Director',
                          fillColor: Color.fromARGB(255, 253, 253, 253),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Movie Actors',
                          fillColor: Color.fromARGB(255, 253, 253, 253),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.group,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
             
                    SizedBox(height: 15),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Movie Review',
                          fillColor: Color.fromARGB(255, 253, 253, 253),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.reviews,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Movie Language',
                          fillColor: Color.fromARGB(255, 253, 253, 253),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.language,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Genre',
                          fillColor: Color.fromARGB(255, 253, 253, 253),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.description,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                     Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Published Date',
                        fillColor: Color.fromARGB(255, 253, 253, 253),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 24, 8),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text('Submit',
                              style: TextStyle(
                                color: Color.fromARGB(255, 247, 247, 247),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
             
             
                 ],
               ),
             ),
      ),
    );
  }
}