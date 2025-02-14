import 'package:flutter/material.dart';

import '../../../../config/app_values.dart';
import '../../../../imports.dart';
import 'add_vehicle_controller.dart';
import 'dropdown_textfied_widget.dart';

class AddVehiclesScreen extends StatelessWidget {
  const AddVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addVehicleProvider = Provider.of<CreateVehicleProvider>(context, listen: false);
    addVehicleProvider.init();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_10,
            child: Column(
              children: [
                CustomHeader(
                  title: AppLocalizations.of(context)!.vehicleProfiles,
                  isOption: true,
                  widgets: IconButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            MediaQuery.of(context).size.width,
                            kToolbarHeight,
                            0.0,
                            0.0),
                        items: [
                          PopupMenuItem(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDeleteConfirmationDialog(
                                      context,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(AppLocalizations.of(context)!
                                          .deleteProfile),
                                      const Icon(Icons.delete)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: PopupMenuItem(
                                    // value: 'option1',
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(AppLocalizations.of(context)!
                                            .edit),
                                        const Icon(Icons.edit),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  )

                ),
                ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the container
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Hatchback",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Icon(Icons.sticky_note_2_sharp),
                              SizedBox(width: 15),
                              Icon(Icons.edit),
                              SizedBox(width: 15),
                              Icon(Icons.delete),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                "Tata Motors",
                                style: TextStyle(fontSize: 20),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 140,
                                height: 35,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    side: MaterialStatePropertyAll(
                                      const BorderSide(
                                          color: Colors.lightGreenAccent,
                                          width: 1), // Green outline
                                    ),
                                    shadowColor:
                                    MaterialStatePropertyAll(Colors.white),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        )),
                                  ),
                                  child: const Text("active"),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
