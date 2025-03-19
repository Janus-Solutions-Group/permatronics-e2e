import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/quarterly/models/landing_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class CageLandingForm extends StatefulWidget {
  const CageLandingForm({
    super.key,
    required this.model,
    required this.onSubmit,
    required this.index,
  });

  final int index;
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
              id: 'landing${widget.index}_cage_monthly_1',
              title: 'Hoistway Controls',
              values: const ["OK", "Inoperable", "None"],
              type: widget.model.hoistwayControls,
              onChangeValue: (value) {
                widget.model.hoistwayControls = value;
              }),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_monthly_2',
            title: 'Hoistway Door Unlocking Device:',
            values: const ["Yes", "No"],
            type: widget.model.hoistwayDoorUnlockingDevice,
            onChangeValue: (value) {
              widget.model.hoistwayDoorUnlockingDevice = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_monthly_3',
            title: 'Hoistway Door Interlock Condition:',
            values: const ["OK", "Replace ", "Other"],
            isTextField: true,
            fieldValue: "other",
            fieldLabelTitle: 'Other',
            type: widget.model.hoistwayDoorInterlockDevice,
            onChangeValue: (value) {
              widget.model.hoistwayDoorInterlockDevice = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_monthly_4',
            title: 'Hoistway Door Electric Contact Condition:',
            values: const ["OK", "Replace", "Other"],
            type: widget.model.hoistwayDoorElectricContactCondition,
            onChangeValue: (value) {
              widget.model.hoistwayDoorElectricContactCondition = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_monthly_5',
            title: 'Hoistway Door Self Closer:',
            values: const ["Yes", "No", "Inoperable", "N/A"],
            type: widget.model.hoistwayDoorSelfCloser,
            onChangeValue: (value) {
              widget.model.hoistwayDoorSelfCloser = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_monthly_6',
            title: 'Landing Zone Switch:',
            values: const ["Yes", "No", "N/A"],
            type: widget.model.landingZoneSwitch,
            onChangeValue: (value) {
              widget.model.landingZoneSwitch = value;
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            id: 'landing${widget.index}_cage_monthly_7',
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
