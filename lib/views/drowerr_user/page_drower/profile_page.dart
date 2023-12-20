import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/controllers/get_profile_controller.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePagess extends StatelessWidget {
  ProfilePagess({Key? key}) : super(key: key);

  GetProfileController _getProfileController = Get.put(GetProfileController());

  final img = 'http://admin.ambrd.in/Images/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => (_getProfileController.isLoading.value)
          ? Center(child: CircularProgressIndicator())
          : _getProfileController?.getProfileDetail?.driverName == null
              ? Center(
                  child: Text('No data'),
                )
              : Scaffold(
                  body: SafeArea(
                    child: Stack(
                      //clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 300,
                          color: MyTheme.ambapp4,
                        ), //Container
                        Positioned(
                          top: 160,
                          left: 10,
                          right: 10,
                          child: Container(
                            width: size.width * 0.6,
                            height: size.height * 0.6,
                            color: MyTheme.ambapp2,
                          ),
                        ),

                        ///name
                        Positioned(
                          top: 170,
                          left: 40,
                          //right: 20,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.account_box,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.025,
                                child: Text(
                                  //'Kumar Prince',
                                  "${_getProfileController.getProfileDetail?.driverName}"
                                      .toString(),

                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.022,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///email....
                        Positioned(
                          top: 210,
                          left: 40,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.025,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.emailId}",
                                  //'kumar261199@gmail.com',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.021,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///phone....
                        Positioned(
                          top: 250,
                          left: 40,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.call,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.025,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.mobileNumber}",

                                  // '7095444555',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.021,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///DL number....
                        Positioned(
                          top: 290,
                          left: 40,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.credit_card,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.025,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.pinCode}",

                                  // 'YU6776FFG',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.021,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///location....
                        Positioned(
                          top: 330,
                          left: 40,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.pin_drop_rounded,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.055,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${_getProfileController.getProfileDetail?.location}",

                                      // 'Bihar Lakhisarai surajgarha 811106',
                                      style: TextStyle(
                                          color: MyTheme.ambapp4,
                                          fontSize: size.height * 0.020,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///button.....
                        Positioned(
                          top: 540,
                          left: 90,
                          right: 90,
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.white,
                            color: MyTheme.ambapp10,
                            child: InkWell(
                              onTap: () {
                                Get.offAll(EditProfilePage());
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: MyTheme.ambapp13,
                                  borderRadius: BorderRadius.circular(20),
                                  //shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.025,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),

                        ///Container
                        Positioned(
                          left: 95,
                          right: 95,
                          top: 75,
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: MyTheme.ambapp3,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '$img${_getProfileController.getProfileDetail?.driverImage}' ??
                                          ''),
                                  // '$img${items?[index].bannerImage}' ??
                                  //     ''
                                ),
                                // AssetImage(
                                //     'lib/assets/Driverwithoutbackgouubd.png')

                                border: Border.all(color: Colors.blueAccent)),

                            /// child: Image.asset('assets/LOGOammbpng.png'),...
                          ),
                        ),

                        ///.............................
                        Positioned(
                          left: 6,
                          top: 3,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Center(
                                        child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'MY Profile',
                                  style: TextStyle(
                                      color: MyTheme.ambapp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///..............................

                        Positioned(
                          left: 6,
                          top: 3,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Center(
                                        child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'MY Profile',
                                  style: TextStyle(
                                      color: MyTheme.ambapp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Container
                      ], //<Widget>[]
                    ),
                  ),
                ),
    );
  }
}
