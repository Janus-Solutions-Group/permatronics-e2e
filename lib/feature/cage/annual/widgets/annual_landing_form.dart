import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manlift_app/feature/cage/annual/model/annnual_landing.dart';

import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualLandingForm extends StatefulWidget {
  const AnnualLandingForm({
    super.key,
    required this.model,
    required this.onSubmit,
    required this.index,
  });
  final int index;
  final CageAnnualLanding model;
  final ValueChanged<CageAnnualLanding> onSubmit;

  @override
  State<AnnualLandingForm> createState() => _AnnualLandingFormState();
}

class _AnnualLandingFormState extends State<AnnualLandingForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "LANDING"),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_1',
            title: 'Hoistway Controls',
            values: const ["OK", "Inoperable", "None"],
            type: widget.model.hoistwayControls,
            onChangeValue: (value) {
              widget.model.hoistwayControls = value;
            },
          ),
          CustomTextField(
            id: 'landing${widget.index}_cage_annual_2',
            title: "Hoistway Door",
            controller: widget.model.hoistwayDoor,
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_3',
            title: 'Hoistway Door Unlocking Device:',
            values: const ["Yes", "No"],
            type: widget.model.hoistwayDoorUnlockingDevice,
            onChangeValue: (value) {
              widget.model.hoistwayDoorUnlockingDevice = value;
            },
          ),
          CustomTextField(
            id: 'landing${widget.index}_cage_annual_4',
            title: "Hoistway Door Interlock Type:",
            controller: widget.model.hoistwayDoorInterlockType,
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_5',
            title: 'Location:',
            type: widget.model.hoistwayDoorInterlockLocation,
            values: const ["Left", "Right ", "Top", "Middle"],
            isTextField: true,
            fieldLabelTitle: 'Other',
            fieldValue: 'other',
            onChangeValue: (value) {
              widget.model.hoistwayDoorInterlockLocation = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_6',
            title: 'Hoistway Door Interlock Condition:',
            values: const ["OK", "Replace ", "Other"],
            type: widget.model.hoistwayDoorInterlockCondition,
            isTextField: true,
            fieldLabelTitle: 'Other',
            fieldValue: 'other',
            onChangeValue: (value) {
              widget.model.hoistwayDoorInterlockCondition = value;
            },
          ),
          CustomTextField(
            id: 'landing${widget.index}_cage_annual_7',
            title: "Hoistway Door Electric Contact Type:",
            controller: widget.model.electricContactType,
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_8',
            title: 'Door Electric Contact Location:',
            values: const ["Left", "Right ", "Top", "Middle"],
            type: widget.model.hoistwayDoorElectricContactLocation,
            onChangeValue: (value) {
              widget.model.hoistwayDoorElectricContactLocation = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_9',
            title: 'Hoistway Door Electric Contact Condition:',
            values: const ["OK", "Replace", "Other"],
            type: widget.model.hoistwayDoorElectricContactCondition,
            onChangeValue: (value) {
              widget.model.hoistwayDoorElectricContactCondition = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_10',
            title: 'Hoistway Door Hinge:',
            values: const ["Left", "Right"],
            type: widget.model.hoistwayDoorHinge,
            onChangeValue: (value) {
              widget.model.hoistwayDoorHinge = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_11',
            title: 'Hoistway Door Self Closer:',
            values: const ["Yes", "No", "Inoperable", "N/A"],
            type: widget.model.hoistwayDoorSelfCloser,
            onChangeValue: (value) {
              widget.model.hoistwayDoorSelfCloser = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_12',
            title: 'Hoistway Door Signs:',
            values: const ["Yes", "No"],
            type: widget.model.hoistwayDoorSigns,
            onChangeValue: (value) {
              widget.model.hoistwayDoorSigns = value;
            },
          ),
          const CustomTitle(title: "Enclosure:"),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                id: 'landing${widget.index}_cage_annual_13',
                title: "Height",
                controller: widget.model.enclosureHeight,
              )),
              Expanded(
                  child: CustomTextField(
                id: 'landing${widget.index}_cage_annual_14',
                title: "Width",
                controller: widget.model.enclosureWidth,
              )),
              Expanded(
                  child: CustomTextField(
                id: 'landing${widget.index}_cage_annual_15',
                title: "Depth",
                controller: widget.model.enclosureWidth,
              )),
            ],
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_16',
            title: 'Enclosure Material:',
            values: const ["Expanded Metal", "Solid Panels", "Concrete"],
            type: widget.model.enclosureMaterial,
            onChangeValue: (value) {
              widget.model.enclosureMaterial = value;
            },
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_17',
            title: 'Enclosure Panels:',
            values: const ["2", "3", "4", "Other"],
            type: widget.model.enclosurePanels,
            onChangeValue: (value) {
              widget.model.enclosurePanels = value;
            },
            isTextField: true,
            fieldLabelTitle: "Other",
            fieldValue: 'other',
          ),
          CustomRadioTile(
            id: 'landing${widget.index}_cage_annual_18',
            title: 'Landing Zone Switch:',
            values: const ["Yes", "No", "N/A"],
            type: widget.model.landingZoneSwitch,
            onChangeValue: (value) {
              widget.model.landingZoneSwitch = value;
            },
          ),
          if (widget.model.landingZoneSwitch == "yes")
            CustomRadioTile(
              id: 'landing${widget.index}_cage_annual_19',
              title: 'Condition',
              values: const ["Ok", "Inoperable"],
              type: widget.model.landingZoneSwitchCondition,
              onChangeValue: (value) {
                widget.model.landingZoneSwitchCondition = value;
              },
            ),
          CustomTextField(
            id: 'landing${widget.index}_cage_annual_20',
            title: "Landing Comments",
            controller: widget.model.landingComments,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
