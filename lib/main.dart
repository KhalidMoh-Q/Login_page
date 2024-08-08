import 'package:flutter/material.dart';
import 'user.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const myhomepage(),
    );
  }
}

bool issequred = true;

List<User> users = [
  User(email: 'Khalid@gmail.com', password: '1234'),
  User(email: 'LegendBssam"gmail.com', password: 'ABCD'),
];

// ignore: camel_case_types
class myhomepage extends StatefulWidget {
  const myhomepage({super.key});

  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "login page ",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.asset(
                  "assets/Tablet login-cuate.png",
                  width: 250,
                  height: 350,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          label: const Text(' Enter Username'),
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.black),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: issequred,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            label: const Text(' Enter PASSWORD'),
                            prefixIcon: const Icon(Icons.lock),
                            // ignore:

                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    issequred = !issequred;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        for (int i = 0; i < users.length; i++) {
                          String email = users[i].email;
                          String password = users[i].password;
if(email==emailcontroller.text && password==passwordcontroller.text){
  print("logged");
 break;
}
  else{
    print("wrong");
  }                       
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black,
                        ),
                        padding: const EdgeInsets.all(
                          8,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
