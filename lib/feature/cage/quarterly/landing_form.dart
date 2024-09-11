import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/quarterly/models/landing_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class CageLandingForm extends StatefulWidget {
  const CageLandingForm(
      {super.key, required this.model, required this.onSubmit});

  final CageQuarterlyLanding model;
  final ValueChanged<CageQuarterlyLanding> onSubmit;

  @override
  State<CageLandingForm> createState() => _CageLandingFormState();
}

class _CageLandingFormState extends State<CageLandingForm>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "LANDING"),
          CustomRadioTile(
              title: 'Hoistway Controls',
              values: const ["OK", "Inoperable", "None"],
              type: widget.model.hoistwayControls,
              onChangeValue: (value) {
                widget.model.hoistwayControls = value;
              }),
          CustomRadioTile(
            title: 'Hoistway Door Unlocking Device:',
            values: const ["Yes", "No"],
            type: widget.model.hoistwayDoorUnlockingDevice,
            onChangeValue: (value) {
              widget.model.hoistwayDoorUnlockingDevice = value;
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Interlock Condition:',
            values: const ["OK", "Replace ", "Other"],
            isTextField: true,
            fieldTitle: 'Other',
            type: widget.model.hoistwayDoorInterlockDevice,
            onChangeValue: (value) {
              widget.model.hoistwayDoorInterlockDevice = value;
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Electric Contact Condition:',
            values: const ["OK", "Replace", "Other"],
            type: widget.model.hoistwayDoorElectricContactCondition,
            onChangeValue: (value) {
              widget.model.hoistwayDoorElectricContactCondition = value;
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Self Closer:',
            values: const ["Yes", "No", "Inoperable", "N/A"],
            type: widget.model.hoistwayDoorSelfCloser,
            onChangeValue: (value) {
              widget.model.hoistwayDoorSelfCloser = value;
            },
          ),
          CustomRadioTile(
            title: 'Landing Zone Switch:',
            values: const ["Yes", "No", "N/A"],
            type: widget.model.landingZoneSwitch,
            onChangeValue: (value) {
              widget.model.landingZoneSwitch = value;
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            values: const ["Ok", "Inoperable"],
            type: widget.model.landingZoneSwitchCondition,
            onChangeValue: (value) {
              widget.model.landingZoneSwitchCondition = value;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
