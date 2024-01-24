import 'dart:io';

import 'package:ambrd_driver_app/controllers/signup_controller.dart';
import 'package:ambrd_driver_app/models/city_model.dart';
import 'package:ambrd_driver_app/models/state_models.dart';
import 'package:ambrd_driver_app/views/login_view_driver/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../constantsss/app_theme/app_color.dart';

//class SignUpPage extends GetView<SignUpController> {

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String gender = "male";

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  SignUpController _signUpController = Get.put(SignUpController());

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
            Get.offAll(LoginScreen());
            // Get.back();
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
              key: _signUpController.SignupFormKey2,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.136,
                    width: size.width * 0.6,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo222.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                  SizedBox(
                    height: 00,
                  ),
                  Text(
                    "SignUp with us!",
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

                  /// driver name
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
                            hintText: 'Driver Name',
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
                              child: Image.asset(
                                'assets/profile.png',
                                //color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _signUpController.DriverName,
                          validator: (value) {
                            return _signUpController.validateName(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  /// driver phone

                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            /// fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Phone',
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
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Image.asset(
                                'assets/smartphone.png',
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          controller: _signUpController.MobileNumber,
                          validator: (value) {
                            return _signUpController.validatemobile(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  /// driver email

                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            // fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Email',
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
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Image.asset(
                                'assets/email.png',
                                //color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          controller: _signUpController.EmailId,
                          validator: (value) {
                            return _signUpController.validateShopname(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  ///todo: state.....
                  Directionality(
                    textDirection: TextDirection.ltr,
                    //child: NeumorphicTextFieldContainer(
                    //child: Padding(
                    // padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Obx(
                      () => DropdownButtonFormField<StateModel>(
                          value: _signUpController.selectedState.value,
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
                              Icons.real_estate_agent,
                              color: Colors.black,
                            ),
                            //enabledBorder: InputBorder.none,
                            // border: InputBorder.none,
                          ),
                          hint: Text('Select State'),
                          items:
                              _signUpController.states.map((StateModel state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(
                                state.stateName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (StateModel? newValue) {
                            _signUpController.selectedState.value = newValue!;
                            _signUpController.selectedCity.value = null;
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

                  ///todo: city.........
                  Directionality(
                    textDirection: TextDirection.ltr,
                    //child: NeumorphicTextFieldContainer(
                    //child: Padding(
                    // padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Obx(
                      () => DropdownButtonFormField<City>(
                          //icon: Icon(Icons.location_city),
                          value: _signUpController.selectedCity.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,
                            hintText: 'Select city',
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
                          hint: Text('Selected City'),
                          items: _signUpController.cities.map((City city) {
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
                            _signUpController.refresh();
                          },
                          onChanged: (City? newValue) {
                            _signUpController.selectedCity.value = newValue!;
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

                  ///address.location.......
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
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.012,
                                horizontal: size.width * 0.02),
                            child: Image.asset(
                              'assets/home.png',
                              // color: MyTheme.t1Iconcolor,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        //obscureText: true,
                        controller: _signUpController.Location,
                        // validator: (value) {
                        //   return _signUpController.validateAddress(value!);
                        // },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  ///pin code........
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
                          hintText: 'pin code',
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
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.012,
                                horizontal: size.width * 0.02),
                            child: Image.asset(
                              'assets/home.png',
                              // color: MyTheme.t1Iconcolor,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        //obscureText: true,
                        controller: _signUpController.PinCode,
                        validator: (value) {
                          return _signUpController.validateAddress(value!);
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  ///todo:pan no...
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: MyTheme.ambapp12,

                              // fillColor: MyTheme.t1Iconcolor,
                              hintText: 'Pan No',
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
                                    BorderSide(color: Colors.green, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // labelText: "Password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.012,
                                    horizontal: size.width * 0.02),
                                child: Image.asset(
                                  'assets/credit-card.png',
                                  //color: MyTheme.t1Iconcolor,
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _modelBottomSheet(context);
                                  },
                                  icon: Icon(Icons.camera_alt_sharp))),
                          // keyboardType: TextInputType.,
                          controller: _signUpController.PanNumbar,
                          // onSaved: (value) {
                          //   _signUpController.aadhar = value!;
                          // },
                          validator: (value) {
                            return _signUpController.validatepan(value!);
                          },
                        ),
                      ),
                    ),
                  ),

                  ///todo:pan image 1...
                  SizedBox(
                    height: size.height * 0.005,
                  ),

                  Obx(() => _signUpController.selectedImagePath.value == ''
                      ? Container(height: size.height * 0.03)
                      : Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.white,
                            child: Image.file(
                              File(_signUpController.selectedImagePath.value),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),

                  SizedBox(
                    height: size.height * 0.005,
                  ),

                  ///todo: dl number..
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            // fillColor: MyTheme.t1Iconcolor,
                            hintText: 'DL No',
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
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // labelText: "Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Image.asset(
                                'assets/credit-card.png',
                                //color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                            // suffixIcon: IconButton(
                            //     onPressed: () {
                            //       //_modelBottomSheet2(context);
                            //     },
                            //     icon: Icon(Icons.camera_alt_sharp))
                          ),
                          keyboardType: TextInputType.name,
                          controller: _signUpController.DlNumber,
                          // onSaved: (value) {
                          //   _signUpController.aadhar = value!;
                          // },
                          validator: (value) {
                            return _signUpController.validatedlno(value!);
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select DL Images:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///todo:dl images 2 3.....
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: size.height * 0.04,
                                  //width: size.width * 0.1,
                                  //color: Colors.blue,
                                  decoration: BoxDecoration(
                                    color: MyTheme.ambapp12,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        _modelBottomSheet2(context);
                                      },
                                      child: Container(
                                          height: size.height * 0.012,
                                          width: size.width * 0.1,
                                          child: Center(
                                            child: Icon(Icons.add_card_rounded),
                                            // Text(
                                            //   'Select Aadhar 1',
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                          )
                                          // Icon(Icons.credit_card_rounded),
                                          ),
                                    ),
                                    // TextFormField(
                                    //   decoration: InputDecoration(
                                    //       filled: true,
                                    //       fillColor: MyTheme.ambapp12,
                                    //
                                    //       // fillColor: MyTheme.t1Iconcolor,
                                    //       hintText: 'Pan No',
                                    //       contentPadding: const EdgeInsets.only(
                                    //           left: 14.0, bottom: 4.0, top: 16.0),
                                    //       focusedBorder: OutlineInputBorder(
                                    //         borderSide: new BorderSide(color: Colors.green),
                                    //         borderRadius: new BorderRadius.circular(10),
                                    //       ),
                                    //       enabledBorder: UnderlineInputBorder(
                                    //         borderSide:
                                    //         new BorderSide(color: Colors.transparent),
                                    //         borderRadius: new BorderRadius.circular(10.0),
                                    //       ),
                                    //       border: OutlineInputBorder(
                                    //         borderSide:
                                    //         BorderSide(color: Colors.green, width: 2.0),
                                    //         borderRadius: BorderRadius.circular(10),
                                    //       ),
                                    //       // labelText: "Password",
                                    //       prefixIcon: Padding(
                                    //         padding: EdgeInsets.symmetric(
                                    //             vertical: size.height * 0.012,
                                    //             horizontal: size.width * 0.02),
                                    //         child: Image.asset(
                                    //           'assets/credit-card.png',
                                    //           //color: MyTheme.t1Iconcolor,
                                    //           height: 10,
                                    //           width: 10,
                                    //         ),
                                    //       ),
                                    //       suffixIcon: IconButton(
                                    //           onPressed: () {
                                    //             _modelBottomSheet(context);
                                    //           },
                                    //           icon: Icon(Icons.camera_alt_sharp))),
                                    //   keyboardType: TextInputType.phone,
                                    //   controller: _signUpController.PanNumbar,
                                    //   // onSaved: (value) {
                                    //   //   _signUpController.aadhar = value!;
                                    //   // },
                                    //   validator: (value) {
                                    //     return _signUpController.validatepan(value!);
                                    //   },
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() =>
                                _signUpController.selectedImagePath2.value == ''
                                    ? Container(
                                        height: size.height * 0.03,
                                        //width: size.width * 0.2,
                                      )
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: 80,
                                          color: Colors.white,
                                          child: Image.file(
                                            File(_signUpController
                                                .selectedImagePath2.value),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: size.height * 0.04,
                                  //width: size.width * 0.1,
                                  //color: Colors.blue,
                                  decoration: BoxDecoration(
                                    color: MyTheme.ambapp12,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        _modelBottomSheet3(context);
                                      },
                                      child: Container(
                                          height: size.height * 0.012,
                                          width: size.width * 0.1,
                                          child: Center(
                                            child: Icon(Icons.add_card_rounded),
                                            // Text(
                                            //   'Select Aadhar 1',
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                          )
                                          // Icon(Icons.credit_card_rounded),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() =>
                                _signUpController.selectedImagePath3.value == ''
                                    ? Container(
                                        height: size.height * 0.03,
                                        //width: size.width * 0.2,
                                      )
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: 80,
                                          color: Colors.white,
                                          child: Image.file(
                                            File(_signUpController
                                                .selectedImagePath3.value),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.013,
                  ),

                  ///todo:charge.....
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,
                            // fillColor: MyTheme.t1Iconcolor,
                            hintText: 'charge',
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
                              child: Image.asset(
                                'assets/lock.png',

                                ///color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          //keyboardType: TextInputType.visiblePassword,
                          controller: _signUpController.charge,
                          validator: (value) {
                            return _signUpController.validateShopname(value!);
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gender (optional)',
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///gender...
                  Container(
                    height: size.height * 0.066,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 25 / 2),
                    decoration: BoxDecoration(
                      color: MyTheme.ambapp12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      child: Container(
                        //width: size.width * 40,
                        height: size.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Radio(
                                  visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  // title: Text("Male"),
                                  value: "Male",
                                  groupValue:
                                      _signUpController.selectedgender.value,
                                  onChanged: (value) {
                                    _signUpController.onChangeGender(value!);
                                    // setState(() {
                                    //   gender = value.toString();
                                    // });
                                  },
                                ),
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: size.width * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Radio(
                                  visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  // title: Text("Male"),
                                  value: "Female",
                                  groupValue:
                                      _signUpController.selectedgender.value,
                                  onChanged: (value) {
                                    _signUpController.onChangeGender(value!);
                                    // setState(() {
                                    //   gender = value.toString();
                                    // });
                                  },
                                ),
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: size.width * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Date of Birth.(optional)',
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///date..of birth...
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            /// fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Select DOB',
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
                            prefixIcon: Icon(Icons.calendar_today)
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: size.height * 0.012,
                            //       horizontal: size.width * 0.02),
                            //   child: Image.asset(
                            //     'lib/assets/images/smartphone.png',
                            //     height: 10,
                            //     width: 10,
                            //   ),
                            // ),
                            ),
                        // decoration: InputDecoration(
                        //   hintText: 'Enter Something',
                        //   contentPadding: EdgeInsets.all(20.0),
                        // ),
                        controller: _signUpController.DOB,
                        onTap: () {
                          _signUpController.chooseDate();
                        },

                        cursorColor: Colors.black,
                        obscureText: false,
                        // decoration: InputDecoration(
                        //   contentPadding: EdgeInsets.all(17.0),
                        //   hintText: 'Select DOB',
                        //   helperStyle: TextStyle(
                        //     // color: black.withOpacity(0.7),
                        //     fontSize: 18,
                        //   ),
                        //   prefixIcon: Icon(
                        //     Icons.calendar_today_outlined,
                        //     // color: black.withOpacity(0.7),
                        //     size: 20,
                        //   ),
                        //   border: InputBorder.none,
                        // ),
                        keyboardType: TextInputType.datetime,
                        maxLines: 1,
                        autofocus: true,
                        //obscureText: true,
                        //controller: _loginpasswordController.mobileController,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Aadhaar Images:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///todo:aadhar front.....
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: size.height * 0.04,
                                  //width: size.width * 0.1,
                                  //color: Colors.blue,
                                  decoration: BoxDecoration(
                                    color: MyTheme.ambapp12,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        _modelBottomSheet4(context);
                                      },
                                      child: Container(
                                          height: size.height * 0.012,
                                          width: size.width * 0.1,
                                          child: Center(
                                            child: Icon(Icons.add_card_rounded),
                                            // Text(
                                            //   'Select Aadhar 1',
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                          )
                                          // Icon(Icons.credit_card_rounded),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() =>
                                _signUpController.selectedImagePath4.value == ''
                                    ? Container(
                                        height: size.height * 0.03,
                                        //width: size.width * 0.2,
                                      )
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: 80,
                                          color: Colors.white,
                                          child: Image.file(
                                            File(_signUpController
                                                .selectedImagePath4.value),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: size.height * 0.04,
                                  //width: size.width * 0.1,
                                  //color: Colors.blue,
                                  decoration: BoxDecoration(
                                    color: MyTheme.ambapp12,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        _modelBottomSheet5(context);
                                      },
                                      child: Container(
                                          height: size.height * 0.012,
                                          width: size.width * 0.1,
                                          child: Center(
                                            child: Icon(Icons.add_card_rounded),
                                            // Text(
                                            //   'Select Aadhar 1',
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                          )
                                          // Icon(Icons.credit_card_rounded),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() =>
                                _signUpController.selectedImagePath5.value == ''
                                    ? Container(
                                        height: size.height * 0.03,
                                        //width: size.width * 0.2,
                                      )
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: 80,
                                          color: Colors.white,
                                          child: Image.file(
                                            File(_signUpController
                                                .selectedImagePath5.value),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),

                  ///todo: aadhar number..
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            // fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Aadhaar No',
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
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // labelText: "Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Image.asset(
                                'assets/credit-card.png',
                                //color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                            // suffixIcon: IconButton(
                            //     onPressed: () {
                            //       //_modelBottomSheet2(context);
                            //     },
                            //     icon: Icon(Icons.camera_alt_sharp))
                          ),
                          keyboardType: TextInputType.name,
                          controller: _signUpController.AadharNumber,
                          // onSaved: (value) {
                          //   _signUpController.aadhar = value!;
                          // },
                          validator: (value) {
                            return _signUpController.validatedlno(value!);
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),

                  SizedBox(
                    height: size.height * 0.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Licence Validity.',
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///licence validity..
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            /// fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Select Validity',
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
                            prefixIcon: Icon(Icons.calendar_today)
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: size.height * 0.012,
                            //       horizontal: size.width * 0.02),
                            //   child: Image.asset(
                            //     'lib/assets/images/smartphone.png',
                            //     height: 10,
                            //     width: 10,
                            //   ),
                            // ),
                            ),
                        // decoration: InputDecoration(
                        //   hintText: 'Enter Something',
                        //   contentPadding: EdgeInsets.all(20.0),
                        // ),
                        controller: _signUpController.DlValidity,
                        onTap: () {
                          _signUpController.chooseDate2();
                        },

                        cursorColor: Colors.black,
                        obscureText: false,
                        // decoration: InputDecoration(
                        //   contentPadding: EdgeInsets.all(17.0),
                        //   hintText: 'Select DOB',
                        //   helperStyle: TextStyle(
                        //     // color: black.withOpacity(0.7),
                        //     fontSize: 18,
                        //   ),
                        //   prefixIcon: Icon(
                        //     Icons.calendar_today_outlined,
                        //     // color: black.withOpacity(0.7),
                        //     size: 20,
                        //   ),
                        //   border: InputBorder.none,
                        // ),
                        keyboardType: TextInputType.datetime,
                        maxLines: 1,
                        autofocus: true,
                        //obscureText: true,
                        //controller: _loginpasswordController.mobileController,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Profile Images:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///todo:profile front.....
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: size.height * 0.04,
                                  //width: size.width * 0.1,
                                  //color: Colors.blue,
                                  decoration: BoxDecoration(
                                    color: MyTheme.ambapp12,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        _modelBottomSheet6(context);
                                      },
                                      child: Container(
                                          height: size.height * 0.012,
                                          width: size.width * 0.1,
                                          child: Center(
                                            child:
                                                Icon(Icons.add_a_photo_rounded),
                                            // Text(
                                            //   'Select Aadhar 1',
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                          )
                                          // Icon(Icons.credit_card_rounded),
                                          ),
                                    ),
                                    // TextFormField(
                                    //   decoration: InputDecoration(
                                    //       filled: true,
                                    //       fillColor: MyTheme.ambapp12,
                                    //
                                    //       // fillColor: MyTheme.t1Iconcolor,
                                    //       hintText: 'Pan No',
                                    //       contentPadding: const EdgeInsets.only(
                                    //           left: 14.0, bottom: 4.0, top: 16.0),
                                    //       focusedBorder: OutlineInputBorder(
                                    //         borderSide: new BorderSide(color: Colors.green),
                                    //         borderRadius: new BorderRadius.circular(10),
                                    //       ),
                                    //       enabledBorder: UnderlineInputBorder(
                                    //         borderSide:
                                    //         new BorderSide(color: Colors.transparent),
                                    //         borderRadius: new BorderRadius.circular(10.0),
                                    //       ),
                                    //       border: OutlineInputBorder(
                                    //         borderSide:
                                    //         BorderSide(color: Colors.green, width: 2.0),
                                    //         borderRadius: BorderRadius.circular(10),
                                    //       ),
                                    //       // labelText: "Password",
                                    //       prefixIcon: Padding(
                                    //         padding: EdgeInsets.symmetric(
                                    //             vertical: size.height * 0.012,
                                    //             horizontal: size.width * 0.02),
                                    //         child: Image.asset(
                                    //           'assets/credit-card.png',
                                    //           //color: MyTheme.t1Iconcolor,
                                    //           height: 10,
                                    //           width: 10,
                                    //         ),
                                    //       ),
                                    //       suffixIcon: IconButton(
                                    //           onPressed: () {
                                    //             _modelBottomSheet(context);
                                    //           },
                                    //           icon: Icon(Icons.camera_alt_sharp))),
                                    //   keyboardType: TextInputType.phone,
                                    //   controller: _signUpController.PanNumbar,
                                    //   // onSaved: (value) {
                                    //   //   _signUpController.aadhar = value!;
                                    //   // },
                                    //   validator: (value) {
                                    //     return _signUpController.validatepan(value!);
                                    //   },
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() =>
                                _signUpController.selectedImagePath6.value == ''
                                    ? Container(
                                        height: size.height * 0.03,
                                        //width: size.width * 0.2,
                                      )
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: size.height * 0.1,
                                          width: 80,
                                          color: Colors.white,
                                          child: Image.file(
                                            File(_signUpController
                                                .selectedImagePath6.value),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),
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
                        "SignUp",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        print(
                            "RadioButton:${_signUpController.selectedService}");

                        _signUpController.checkSignupdriver();
                        // Get.to(() => LoginPasswordPage());
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
                  _signUpController.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _signUpController.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _modelBottomSheet2(BuildContext context) {
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
                  _signUpController.getImage2(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _signUpController.getImage2(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _modelBottomSheet3(BuildContext context) {
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
                  _signUpController.getImage3(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _signUpController.getImage3(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _modelBottomSheet4(BuildContext context) {
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
                  _signUpController.getImage4(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _signUpController.getImage4(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _modelBottomSheet5(BuildContext context) {
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
                  _signUpController.getImage5(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _signUpController.getImage5(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  _modelBottomSheet6(BuildContext context) {
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
                  _signUpController.getImage6(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _signUpController.getImage6(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
