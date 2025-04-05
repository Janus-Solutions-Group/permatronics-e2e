import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manlift_app/data/models/customer.dart';
import 'package:manlift_app/data/models/header.dart';
import 'package:manlift_app/data/models/new_units.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

class HeaderForm extends StatefulWidget {
  const HeaderForm(
      {super.key, required this.pageController, required this.headerModel});

  final PageController pageController;
  final HeaderModel headerModel;

  @override
  State<HeaderForm> createState() => _HeaderFormState();
}

class _HeaderFormState extends State<HeaderForm>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
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
                              widget.headerModel.formdate = date;
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
                    widget.headerModel.customer = val!.accountName.toString();
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
                    widget.headerModel.unitName = val!.name.toString();
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
                id: "header1",
                title: "Manufacturer",
                controller: fieldControllers[2],
                onChanged: (val) {
                  widget.headerModel.manufacturer = val.toString();
                },
              ),
              CustomTextField(
                id: "header2",
                title: "Designation of Unit:",
                controller: fieldControllers[3],
                onChanged: (val) {
                  widget.headerModel.designationOfUnit = val.toString();
                },
              ),
              CustomTextField(
                id: "header3",
                title: "Address:",
                controller: fieldControllers[4]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.mailingAddress != null
                          ? selectedCustomer!.mailingAddress.toString()
                          : ""
                      : "",
                onChanged: (val) {
                  widget.headerModel.address = val.toString();
                },
              ),
              CustomTextField(
                id: "header4",
                title: "Rated Load:",
                controller: fieldControllers[5],
                onChanged: (val) {
                  widget.headerModel.ratedLoad = val.toString();
                },
              ),
              CustomTextField(
                id: "header5",
                title: "Landings:",
                controller: fieldControllers[6],
                onChanged: (val) {
                  widget.headerModel.landing = val.toString();
                },
              ),
              // CustomTextField(
              //   title: "Landings:",
              //   controller: fieldControllers[7],
              // ),
              CustomTextField(
                id: "header6",
                title: "City",
                controller: fieldControllers[8]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.city != null
                          ? selectedCustomer!.city.toString()
                          : ""
                      : "",
                onChanged: (val) {
                  widget.headerModel.city = val.toString();
                },
              ),
              CustomTextField(
                id: "header7",
                title: "State",
                controller: fieldControllers[9]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.state != null
                          ? selectedCustomer!.state.toString()
                          : ""
                      : "",
                onChanged: (val) {
                  widget.headerModel.state = val.toString();
                },
              ),
              CustomTextField(
                id: "header8",
                title: "Zip",
                controller: fieldControllers[10]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.zip != null
                          ? selectedCustomer!.zip.toString()
                          : ""
                      : "",
                onChanged: (val) {
                  widget.headerModel.zip = val.toString();
                },
              ),
              CustomTextField(
                id: "header9",
                title: "Serial Number:",
                controller: fieldControllers[11],
                onChanged: (val) {
                  widget.headerModel.serialNumber = val.toString();
                },
              ),
              CustomTextField(
                id: "header10",
                title: "Contact Name",
                controller: fieldControllers[12],
                onChanged: (val) {
                  widget.headerModel.contactName = val.toString();
                },
              ),
              CustomTextField(
                id: "header11",
                title: "Inspector(s):",
                controller: fieldControllers[13],
                onChanged: (val) {
                  widget.headerModel.inspector = val.toString();
                },
              ),
              CustomTextField(
                id: "header12",
                title: "Phone",
                controller: fieldControllers[14]
                  ..text = selectedCustomer != null
                      ? selectedCustomer!.phone != null
                          ? selectedCustomer!.phone.toString()
                          : ""
                      : "",
                onChanged: (val) {
                  widget.headerModel.phone = val.toString();
                },
              ),
              CustomTextField(
                id: "header13",
                title: "Email",
                controller: fieldControllers[15],
                onChanged: (val) {
                  widget.headerModel.email = val.toString();
                },
              ),
              CustomTextField(
                id: "header14",
                title: "Problem reported by Customer:",
                controller: fieldControllers[16],
                onChanged: (val) {
                  widget.headerModel.problemRepotedByCustomer = val.toString();
                },
              ),
              CustomTextField(
                id: "header15",
                title: "Send Report To:",
                controller: fieldControllers[17],
                onChanged: (val) {
                  widget.headerModel.sendReportTo = val.toString();
                },
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

  @override
  bool get wantKeepAlive => true;
}
