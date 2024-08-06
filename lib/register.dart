import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Enter phone or email',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Phone'),
                  Tab(text: 'Email'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PhoneTab(isPhoneSelected: true),
                  EmailTab(isEmailSelected: true,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneTab extends StatelessWidget {
  final bool isPhoneSelected;

  const PhoneTab({Key? key, required this.isPhoneSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Phone Number',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF4E4F50),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: isPhoneSelected ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !isPhoneSelected,
            child: Container(
              margin: EdgeInsets.all(15.0),
              color: Color.fromARGB(255, 212, 211, 211),
              child: TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: 'ID +62 ',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'View our Privacy Policy',
              style: TextStyle(
                color: Color(0xff006df1),
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF736ce0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.symmetric(horizontal: 190, vertical: 12.0),
          ),
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class EmailTab extends StatelessWidget {
  final bool isEmailSelected;

  const EmailTab({Key? key, required this.isEmailSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Email',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF4E4F50),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: isEmailSelected ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !isEmailSelected,
            child: Container(
              margin: EdgeInsets.all(15.0),
              color: Color(0xFFD4D3D3),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'View our Privacy Policy',
              style: TextStyle(
                color: Color(0xff006df1),
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF736ce0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.symmetric(horizontal: 190, vertical: 12.0),
          ),
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
