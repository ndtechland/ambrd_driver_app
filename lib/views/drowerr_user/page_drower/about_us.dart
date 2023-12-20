import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../constantsss/app_theme/app_color.dart';

class UserAboutUsView extends StatelessWidget {
  UserAboutUsView({Key? key}) : super(key: key);

  // UserAboutusController _userAboutusController =
  // Get.put(UserAboutusController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ambapp4,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ambapp,
        elevation: 0,
        title: Text('About Us'),
      ),
      body:
          // Obx(
          //       () => (_userAboutusController.isLoading.value)
          //       ? Center(
          //     child: CircularProgressIndicator(),
          //   )
          //       :
          SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Us:',
                        style: GoogleFonts.poppins(
                            color: MyTheme.ambapp,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.25,
                        child: Lottie.asset(
                            // 'lib/assets/image/68816-about.zip'
                            'assets/animation_lnk7o8on.zip'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    """Welcome to Ambrd Driver!

At Ambrd Driver, we're dedicated to ensuring rapid and reliable emergency medical assistance right at your fingertips. Our mission is to provide swift access to professional medical care when every second counts.

Who We Are:
We are a team of passionate healthcare professionals, technologists, and emergency response experts committed to revolutionizing emergency medical services. With years of experience in the healthcare industry, we understand the critical importance of timely medical attention.

What We Do:
Our app connects individuals in need of urgent medical assistance with nearby ambulance services efficiently and effectively. We leverage cutting-edge technology to bridge the gap between patients and emergency responders, minimizing response times and maximizing the chances of saving lives.

Our Commitment:
At Ambrd Driver, we prioritize safety, efficiency, and compassion. We are dedicated to providing seamless, user-friendly experiences during emergencies. We work tirelessly to ensure that help is just a few taps away, offering peace of mind to our users and their loved ones.

Why Choose Us:

Rapid Response: Our app is designed for swift emergency response, ensuring that help reaches you promptly.
Reliable Services: We collaborate with certified ambulance services and trained professionals, guaranteeing quality care.
User-Friendly Interface: Our intuitive app interface makes it easy for anyone to request emergency assistance.
Safety and Security: Your safety and privacy are our top priorities. We employ robust security measures to safeguard your information.
Join us in our mission to make emergency medical care more accessible and efficient for everyone. Together, we can make a difference in saving lives.

Thank you for choosing Ambrd Driver!""",
                    //"This is ambulance app",
                    // "${_userAboutusController.useraboutusModel?.about.toString()}",
                    style: GoogleFonts.roboto(
                        color: MyTheme.ambapp,
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      //),
    );
  }
}
