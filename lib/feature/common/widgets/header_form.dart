import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manlift_app/data/models/customer.dart';
import 'package:manlift_app/data/models/new_units.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

class HeaderForm extends StatefulWidget {
  const HeaderForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<HeaderForm> createState() => _HeaderFormState();
}

class _HeaderFormState extends State<HeaderForm> {
  final _formKey = GlobalKey<FormState>();
  List<CustomerDetail> customer = [];
  List<NewUnitsModel> units = [];
  List<NewUnitsModel> filteredUnits = [];

  @override
  void initState() {
    super.initState();
    getLocalCustomers();
    getLocalUnits();
  }

  Future<List<CustomerDetail>> getLocalCustomers() async {
    var input = await rootBundle.loadString('assets/customers.json');
    if (mounted) {
      customer = customerDetailFromJson(input);
      setState(() {});
    }
    return customer;
  }

  Future<List<NewUnitsModel>> getLocalUnits() async {
    var input = await rootBundle.loadString('assets/test.json');
    if (mounted) {
      units = newUnitsModelFromJson(input);
      filteredUnits = units;
      setState(() {});
    }

    return units;
  }

  DateTime? _selectedDate;
  CustomerDetail? selectedCustomer;
  NewUnitsModel? selectedUnit;

  List<TextEditingController> fieldControllers =
      List.generate(18, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitle(title: "Select Date"),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate != null
                            ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                            : 'dd-MM-YY',
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () async {
                          var date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              _selectedDate = date;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              const Text(
                "Customer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              DropdownSearch<CustomerDetail>(
                items: customer,
                itemAsString: (item) => item.accountName!,
                popupProps: const PopupProps.menu(showSearchBox: true),
                onChanged: (val) {
                  setState(() {
                    selectedUnit = null;
                    filteredUnits = units
                        .where((e) => e.customerName != null
                            ? e.customerName!.id == val!.id
                            : false)
                        .toList();

                    selectedCustomer = val;
                  });
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(hintText: 'Select Customer'),
                ),
              ),
              // CustomTextField(
              //   title: "Customer#",
              //   controller: fieldControllers[0],
              // ),
              const SizedBox(height: 15),
              const Text(
                "Unit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              DropdownSearch<NewUnitsModel>(
                items: filteredUnits,
                itemAsString: (item) => item.name!,
                selectedItem: selectedUnit,
                popupProps: const PopupProps.menu(showSearchBox: true),
                onChanged: (val) {
                  setState(() {
                    selectedUnit = val;
                  });
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(hintText: 'Select Unit'),
                ),
              ),
              // CustomTextField(
              //   title: "Unit#",
              //   controller: fieldControllers[1],
              // ),
              CustomTextField(
                title: "Manufacturer",
                controller: fieldControllers[2],
              ),
              CustomTextField(
                title: "Designation of Unit:",
                controller: fieldControllers[3],
              ),
              CustomTextField(
                title: "Address:",
                controller: fieldControllers[4]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.mailingAddress.toString()
                      : "",
              ),
              CustomTextField(
                title: "Rated Load:",
                controller: fieldControllers[5],
              ),
              CustomTextField(
                title: "Landings:",
                controller: fieldControllers[6],
              ),
              CustomTextField(
                title: "Landings:",
                controller: fieldControllers[7],
              ),
              CustomTextField(
                title: "City",
                controller: fieldControllers[8]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.city.toString()
                      : "",
              ),
              CustomTextField(
                title: "State",
                controller: fieldControllers[9]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.state.toString()
                      : "",
              ),
              CustomTextField(
                title: "Zip",
                controller: fieldControllers[10]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.zip.toString()
                      : "",
              ),
              CustomTextField(
                title: "Serial Number:",
                controller: fieldControllers[11],
              ),
              CustomTextField(
                title: "Contact Name",
                controller: fieldControllers[12],
              ),
              CustomTextField(
                title: "Inspector(s):",
                controller: fieldControllers[13],
              ),
              CustomTextField(
                title: "Phone",
                controller: fieldControllers[14]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.phone.toString()
                      : "",
              ),
              CustomTextField(
                title: "Email",
                controller: fieldControllers[15],
              ),
              CustomTextField(
                title: "Problem reported by Customer:",
                controller: fieldControllers[16],
              ),
              CustomTextField(
                title: "Send Report To:",
                controller: fieldControllers[17],
              ),
              PageNavigationButton(
                pageController: widget.pageController,
                right: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
