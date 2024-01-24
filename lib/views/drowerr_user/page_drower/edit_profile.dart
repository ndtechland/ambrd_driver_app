import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/controllers/get_profile_controller.dart';
import 'package:ambrd_driver_app/controllers/update_profile_controller.dart';
import 'package:ambrd_driver_app/models/city_model.dart';
import 'package:ambrd_driver_app/models/state_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../controllers/signup_driver_controller/signup_controler.dart';

//class SignUpPage extends GetView<SignUpController> {

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String gender = "male";

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  EditprofileController _editprofileController =
      Get.put(EditprofileController());

  GetProfileController _getProfileController = Get.put(GetProfileController());
  // SignUpController _signUpController = Get.put(SignUpController());

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ambapp3,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MyTheme.ambapp,
          ),
        ),
        backgroundColor: MyTheme.ambapp3,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: _editprofileController.EditprofileFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.13,
                    width: size.width * 0.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/ambrdcommanlogo.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 00,
                  ),
                  Text(
                    "Edit Profile",
                    style: GoogleFonts.alegreyaSc(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.ambapp1),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,
                            //fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Name',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 16.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.transparent),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // labelText: "Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Icon(Icons.account_circle),
                              // Image.asset(
                              //   'assets/profile.png',
                              //   //color: MyTheme.t1Iconcolor,
                              //   height: 10,
                              //   width: 10,
                              // ),
                            ),
                          ),
                          //keyboardType: TextInputType.visiblePassword,
                          controller: _editprofileController.PatientName,
                          validator: (value) {
                            return _editprofileController.validateName(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  Directionality(
                    textDirection: TextDirection.ltr,
                    //child: NeumorphicTextFieldContainer(
                    //child: Padding(
                    // padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Obx(
                      () => DropdownButtonFormField<StateModel>(
                          value:
                              //_getProfileController
                              _editprofileController.selectedState.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,
                            hintText:
                                "${_getProfileController.getProfileDetail?.stateName.toString()}",
                            // 'Select State',

                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 16.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.transparent),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.real_estate_agent,
                              color: Colors.black,
                            ),
                            //enabledBorder: InputBorder.none,
                            // border: InputBorder.none,
                          ),
                          hint: Text(
                            "${_getProfileController.getProfileDetail?.stateName.toString()}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          items: _editprofileController.states
                              .map((StateModel state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(
                                state.stateName,

                                //       if (state.stateName == null)
                                //       {
                                //       state.stateName,
                                //       }else {
                                //
                                //
                                // }
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (StateModel? newValue) {
                            _editprofileController.selectedState.value =
                                newValue!;
                            _editprofileController.selectedCity.value = null;
                            // _hospital_2_controller.states.value =
                            //     newValue! as List<String>;
                            // _hospital_2_controller.selectedCity.value = null;
                            // _hospital_2_controller.cities.clear();
                            // _hospital_2_controller.cities
                            //     .addAll(stateCityMap[newvalue]!);
                          }),
                    ),
                    //),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(0.0),
                    //   child: TextFormField(
                    //     //maxLines: 5,
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: MyTheme.ambapp12,
                    //
                    //       // fillColor: MyTheme.t1Iconcolor,
                    //       hintText: 'State',
                    //       contentPadding: const EdgeInsets.only(
                    //           left: 14.0, bottom: 4.0, top: 16.0),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: new BorderSide(color: Colors.green),
                    //         borderRadius: new BorderRadius.circular(10),
                    //       ),
                    //       enabledBorder: UnderlineInputBorder(
                    //         borderSide:
                    //             new BorderSide(color: Colors.transparent),
                    //         borderRadius: new BorderRadius.circular(10.0),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderSide:
                    //             BorderSide(color: Colors.red, width: 2.0),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       prefixIcon: Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: size.height * 0.012,
                    //             horizontal: size.width * 0.02),
                    //         child: Image.asset(
                    //           'lib/assets/images/home.png',
                    //           // color: MyTheme.t1Iconcolor,
                    //           height: 10,
                    //           width: 10,
                    //         ),
                    //       ),
                    //     ),
                    //     keyboardType: TextInputType.streetAddress,
                    //     //obscureText: true,
                    //     controller: _signUpController.state,
                    //     validator: (value) {
                    //       return _signUpController.validateState(value!);
                    //     },
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    //child: NeumorphicTextFieldContainer(
                    //child: Padding(
                    // padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Obx(
                      () => DropdownButtonFormField<City>(
                          //icon: Icon(Icons.location_city),
                          value: _editprofileController.selectedCity.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,
                            hintText: 'Select State',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 16.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.transparent),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.location_city_outlined,
                              color: Colors.black,
                            ),
                            //enabledBorder: InputBorder.none,
                            // border: InputBorder.none,
                          ),
                          hint: Text(
                            "${_getProfileController.getProfileDetail?.cityName.toString()}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          items: _editprofileController.cities.map((City city) {
                            return DropdownMenuItem(
                              value: city,
                              child: Text(
                                city.cityName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            );
                          }).toList(),
                          onTap: () {
                            _editprofileController.refresh();
                          },
                          onChanged: (City? newValue) {
                            _editprofileController.selectedCity.value =
                                newValue!;
                            // _hospital_2_controller.states.value =
                            //     newValue! as List<String>;
                            // _hospital_2_controller.selectedCity.value = null;
                            // _hospital_2_controller.cities.clear();
                            // _hospital_2_controller.cities
                            //     .addAll(stateCityMap[newvalue]!);
                          }),
                    ),
                    //),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(0.0),
                    //   child: TextFormField(
                    //     //maxLines: 5,
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: MyTheme.ambapp12,
                    //
                    //       // fillColor: MyTheme.t1Iconcolor,
                    //       hintText: 'State',
                    //       contentPadding: const EdgeInsets.only(
                    //           left: 14.0, bottom: 4.0, top: 16.0),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: new BorderSide(color: Colors.green),
                    //         borderRadius: new BorderRadius.circular(10),
                    //       ),
                    //       enabledBorder: UnderlineInputBorder(
                    //         borderSide:
                    //             new BorderSide(color: Colors.transparent),
                    //         borderRadius: new BorderRadius.circular(10.0),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderSide:
                    //             BorderSide(color: Colors.red, width: 2.0),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       prefixIcon: Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: size.height * 0.012,
                    //             horizontal: size.width * 0.02),
                    //         child: Image.asset(
                    //           'lib/assets/images/home.png',
                    //           // color: MyTheme.t1Iconcolor,
                    //           height: 10,
                    //           width: 10,
                    //         ),
                    //       ),
                    //     ),
                    //     keyboardType: TextInputType.streetAddress,
                    //     //obscureText: true,
                    //     controller: _signUpController.state,
                    //     validator: (value) {
                    //       return _signUpController.validateState(value!);
                    //     },
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        //maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyTheme.ambapp12,
                          //fillColor: MyTheme.t1Iconcolor,
                          hintText: 'Address',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 4.0, top: 16.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.green),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.location_on),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: size.height * 0.012,
                          //       horizontal: size.width * 0.02),
                          //   child: Image.asset(
                          //     'lib/assets/images/home.png',
                          //     // color: MyTheme.t1Iconcolor,
                          //     height: 10,
                          //     width: 10,
                          //   ),
                          // ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        //obscureText: true,
                        controller: _editprofileController.Location,
                        validator: (value) {
                          return _editprofileController.validateAddress(value!);
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        //maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyTheme.ambapp12,
                          //fillColor: MyTheme.t1Iconcolor,
                          hintText: 'Pin',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 4.0, top: 16.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.green),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.pin),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: size.height * 0.012,
                          //       horizontal: size.width * 0.02),
                          //   child: Image.asset(
                          //     'lib/assets/images/home.png',
                          //     // color: MyTheme.t1Iconcolor,
                          //     height: 10,
                          //     width: 10,
                          //   ),
                          // ),
                        ),
                        keyboardType: TextInputType.number,
                        //obscureText: true,
                        controller: _editprofileController.PinCode,
                        validator: (value) {
                          return _editprofileController.validpin(value!);
                        },
                      ),
                    ),
                  ),

                  ///image2
                  // Obx(() => _signUpController.selectedImagePath.value == ''
                  //     ? Container(height: size.height * 0.03)
                  //     : Align(
                  //         alignment: Alignment.centerRight,
                  //         child: Container(
                  //           height: 80,
                  //           width: 80,
                  //           color: Colors.white,
                  //           child: Image.file(
                  //             File(_signUpController.selectedImagePath.value),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       )),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  // Directionality(
                  //   textDirection: TextDirection.ltr,
                  //   child: Center(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(0.0),
                  //       child: TextFormField(
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: MyTheme.ambapp12,
                  //             // fillColor: MyTheme.t1Iconcolor,
                  //             hintText: 'Your Image',
                  //             contentPadding: const EdgeInsets.only(
                  //                 left: 14.0, bottom: 4.0, top: 16.0),
                  //             focusedBorder: OutlineInputBorder(
                  //               borderSide: new BorderSide(color: Colors.red),
                  //               borderRadius: new BorderRadius.circular(10),
                  //             ),
                  //             enabledBorder: UnderlineInputBorder(
                  //               borderSide:
                  //                   new BorderSide(color: Colors.transparent),
                  //               borderRadius: new BorderRadius.circular(10.0),
                  //             ),
                  //             border: OutlineInputBorder(
                  //               borderSide:
                  //                   BorderSide(color: Colors.green, width: 2.0),
                  //               borderRadius: BorderRadius.circular(10),
                  //             ),
                  //             // labelText: "Password",
                  //             prefixIcon: Padding(
                  //               padding: EdgeInsets.symmetric(
                  //                   vertical: size.height * 0.012,
                  //                   horizontal: size.width * 0.02),
                  //               child: Icon(Icons.image),
                  //               // Image.asset(
                  //               //   'assets/credit-card.png',
                  //               //   //color: MyTheme.t1Iconcolor,
                  //               //   height: 10,
                  //               //   width: 10,
                  //               // ),
                  //             ),
                  //             suffixIcon: IconButton(
                  //                 onPressed: () {
                  //                   _modelBottomSheet(context);
                  //                 },
                  //                 icon: Icon(Icons.camera_alt_sharp))),
                  //         keyboardType: TextInputType.phone,
                  //         //controller: _signUpController.Gender,
                  //         // onSaved: (value) {
                  //         //   _signUpController.aadhar = value!;
                  //         // },
                  //         validator: (value) {
                  //           return _signUpController.validateaadharcard(value!);
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ///

                  ///start image...
                  // Obx(() => _signUpController.selectedImagePath.value == ''
                  //     ? Container(height: size.height * 0.03)
                  //     : Align(
                  //         alignment: Alignment.centerRight,
                  //         child: Container(
                  //           height: 80,
                  //           width: 80,
                  //           color: Colors.white,
                  //           child: Image.file(
                  //             //File(_signUpController.selectedImagePath.value),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       )),
                  ///image end
                  // Container(
                  //   width: size.width,
                  //   height: size.height * 0.06,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: MyTheme.t1bacgroundcolors1,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: size.width * 0.4,
                  //         child: Row(
                  //           children: [
                  //             Obx(
                  //               () => Radio(
                  //                 // title: Text("Male"),
                  //                 value: "Repair",
                  //                 groupValue:
                  //                     _signUpController.selectedService.value,
                  //                 onChanged: (value) {
                  //                   _signUpController.onChangeService(value!);
                  //                   // setState(() {
                  //                   //   gender = value.toString();
                  //                   // });
                  //                 },
                  //               ),
                  //             ),
                  //             Text('Repair')
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: size.width * 0.4,
                  //         child: Row(
                  //           children: [
                  //             Obx(
                  //               () => Radio(
                  //                 // title: Text("Male"),
                  //                 value: "Customer",
                  //                 groupValue:
                  //                     _signUpController.selectedService.value,
                  //                 onChanged: (value) {
                  //                   _signUpController.onChangeService(value!);
                  //                   // setState(() {
                  //                   //   gender = value.toString();
                  //                   // });
                  //                 },
                  //               ),
                  //             ),
                  //             Text('Sell')
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.t1containercolor),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        print(
                            "RadioButton:${_editprofileController.selectedService}");
                        _editprofileController.checkeditprofileuser();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _modelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.camera_alt_sharp),
                title: const Text('Camera'),
                onTap: () {
                  // _signUpController.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  // _signUpController.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
