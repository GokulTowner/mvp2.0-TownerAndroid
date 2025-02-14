import 'package:flutter/material.dart';

import '../../../../imports.dart';
import '../model/car_make_modal.dart';
import '../model/vehicle_common_modal.dart';
import 'add_vehicle_controller.dart';
import 'add_vehicle_screen.dart';
import 'dropdown_textfied_widget.dart';

class ManageVehiclesScreen extends StatelessWidget {
  const ManageVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addVehicleProvider = context.read<CreateVehicleProvider>();
    return Consumer<CreateVehicleProvider>( builder: (BuildContext context, CreateVehicleProvider value, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Add Vehicle"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),

                DropdownButton<CarData>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.grey,
                  ),
                  isExpanded: true,
                  hint: const Text('Car Make',
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: addVehicleProvider.selectedCarMake,
                  onChanged: (value){
                    addVehicleProvider.setCarData(value);
                    print('Selected value: $value');

                  },
                  items: addVehicleProvider.getCarMake().map<DropdownMenuItem<CarData>>((CarData value) {
                    return DropdownMenuItem<CarData>(
                      value: value,
                      child: Text(value.make??''),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 80,
                ),
                DropdownButton<String>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.grey,
                  ),
                  isExpanded: true,
                  hint: const Text('Car Model',
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: addVehicleProvider.selectedCarModal,
                  onChanged: (value){
                    addVehicleProvider.setCarModal(value);
                    print('Selected value: $value');
                  },
                  items: addVehicleProvider.getCarModal().map<DropdownMenuItem<String>>((String? value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value??''),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 80,
                ),
                DropdownButton<VehicleCommon>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.grey,
                  ),
                  isExpanded: true,
                  hint: const Text('Car Model Year',
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: addVehicleProvider.selectedYear,
                  onChanged: (value){
                    addVehicleProvider.setYear(value);
                    print('Selected value: $value');

                  },
                  items: addVehicleProvider.getCarModalYear().map<DropdownMenuItem<VehicleCommon>>((VehicleCommon value) {
                    return DropdownMenuItem<VehicleCommon>(
                      value: value,
                      child: Text(value.name??''),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 80,
                ),
                DropdownButton<VehicleCommon>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.grey,
                  ),
                  isExpanded: true,
                  hint: const Text('Car Color',
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: addVehicleProvider.selectedColor,
                  onChanged: (value){
                    addVehicleProvider.setColor(value);
                    print('Selected value: $value');

                  },
                  items: addVehicleProvider.getCarColor().map<DropdownMenuItem<VehicleCommon>>((VehicleCommon value) {
                    return DropdownMenuItem<VehicleCommon>(
                      value: value,
                      child: Text(value.name??''),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 80,
                ),
                DropdownButton<String>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.grey,
                  ),
                  isExpanded: true,
                  hint: const Text('Car Type',
                    style: TextStyle(color: Colors.grey),
                  ),
                  value: addVehicleProvider.selectedType,
                  onChanged: (value){
                    addVehicleProvider.setTyper(value);
                    print('Selected value: $value');

                  },
                  items: addVehicleProvider.typeList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: addVehicleProvider.licence,
                      decoration: InputDecoration(
                        hintText: 'License Plate(Eg:TN58AC1234) OR (TN58AC1234)',
                        hintStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 80,
                ),
                /*DropdownTextField(
                    items: const ['Sedan', 'SUV', 'Hatchback', 'Truck', 'Coupe'],
                    hintText: "Vehicle type",
                    onChanged: (value) {
                      print('Selected value: $value');
                    }),*/
                // const SizedBox(
                //   height: 80,
                // ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        const MaterialStatePropertyAll(Colors.lightGreenAccent),
                        foregroundColor:
                        const MaterialStatePropertyAll(Colors.black87),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)))),
                    child: const Text('Submit'),
                    onPressed: () {
                      addVehicleProvider.createVehicle(context);
                    }, //--------add a function
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
