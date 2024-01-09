import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('DoMeNow', 
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black, fontSize: 18, fontFamily: 'Poppins')),
      ),
      body: PageView(
        children: const [
           Plan(),
           Schedule(),
        ],
      )
    );
  }
}

class Schedule extends StatelessWidget {
  const Schedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(children: [
      SizedBox(
        child:  Text.rich(
          TextSpan(
          text: "Want to be more productive? Plan your day with ",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25,
          fontFamily: 'Poppins',
           color: Colors.black, fontWeight: FontWeight.w500),
          children: [
            TextSpan(text: 'DoMeNow', 
            style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25, 
            color: Theme.of(context).primaryColor, 
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500, decoration: TextDecoration.underline,height: 1.5) )
          ]
          ))),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
             decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/person.jpg'),fit: BoxFit.contain)),
          ),
    ],),);
  }
}

class Plan extends StatelessWidget {
  const Plan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(children: [
      SizedBox(
        child:  Text.rich(
          TextSpan(
          text: "Want to be more productive? Plan your day with ",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25,
          fontFamily: 'Poppins',
           color: Colors.black, fontWeight: FontWeight.w500),
          children: [
            TextSpan(text: 'DoMeNow', 
            style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25, 
            color: Theme.of(context).primaryColor, 
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500, decoration: TextDecoration.underline,height: 1.5) )
          ]
          ))),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
             decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/person.jpg'),fit: BoxFit.contain)),
          ),
    ],),);
  }
}
