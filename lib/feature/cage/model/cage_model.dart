import 'dart:convert';

class CageInspection {
  String? bottomPlatform;
  String? pit;
  String? clean;
  String? pitSwitch;
  String? switchLocation;
  String? pitLight;
  String? pitLightSwitch;
  String? carBuffers;
  String? runbyCarBuffers;
  String? counterweightBuffers;
  String? runbyCounterweightBuffers;
  String? governorCableTensioner;
  String? conditionGovernorCableTensioner;
  String? bottomNormalTerminal;
  String? bottomFinalTerminal;
  String? pitComments;
  String? underCarSize;
  String? measurementFrom;
  String? frontBack;
  String? rightLeft;
  String? travelCableConnectionAndCondition;
  String? safetyType;
  String? safetyLocation;
  String? safetyCondition;
  String? switchOnSafeties;
  String? carGuideRailsType;
  String? carGuideRailsSize;
  String? carGuideRailsCondition;
  String? carGuideRailsWhy;
  String? carGuideRailsDbg;
  String? carGuideRailBrackets;
  String? carGuideType;
  String? carGuideCondition;
  String? counterweightLocationFacingCar;
  String? counterweightGuideRailType;
  String? counterweightGuideRailSize;
  String? counterweightGuideRailDbg;
  String? counterweightGuideRailCondition;
  String? counterweightGuideRailBrackets;
  String? cwDimension;
  String? cwMaterial;
  String? cwGuideType;
  String? cwCondition;
  String? hoistwayLadder;
  String? hoistwayControls;
  String? hoistwayDoor;
  String? hoistwayDoorUnlockingDevice;
  String? hoistwayDoorInterlockType;
  String? hoistwayDoorInterlockLocation;
  String? hoistwayDoorInterlockCondition;
  String? hoistwayDoorElectricContactType;
  String? hoistwayDoorElectricContactLocation;
  String? hoistwayDoorElectricContactCondition;
  String? hoistwayDoorHinge;
  String? hoistwayDoorSelfCloser;
  String? hoistwayDoorSigns;
  String? enclosure;
  String? enclosureMaterial;
  String? enclosurePanels;
  String? landingZoneSwitch;
  String? landingZoneSwitchCondition;
  String? landingComments;
  String? carConditionAndDescriptionCam;
  String? carConditionAndDescriptionLocation;
  String? carConditionAndDescriptionCondition;
  String? carDoorType;
  String? carDoorMaterial;
  String? carDoorCondition;
  String? carDoorLimit;
  String? carOperationControlsUp;
  String? carOperationControlsDown;
  String? carLight;
  String? carLightSwitch;
  String? carAlarm;
  String? carAlarmSwitch;
  String? emergencyStop;
  String? capacitySignage;
  String? commDevice;
  String? emergencyEscapeHatch;
  String? emergencyEscapeHatchSwitch;
  String? manualBackupCarAlarm;
  String? manualBackupCarAlarmType;
  String? dataPlate;
  String? typeOfCableAttachmentToCar;
  String? ccfHoistcableFastenersToCar;
  String? ccfNoOfFastenersPerCable;
  String? ccfHoistcableFastenersToCW;
  String? ccfHoistcableNumber;
  String? ccfHoistcableSize;
  String? ccfHoistcableCondition;
  String? ccfGovernorCableSize;
  String? ccfGovernorCableCondition;
  String? ccfGovernorCablefasteners;
  String? ccfGovernorReleaseType;
  String? ccfGovernorReleaseLocation;
  String? driveSupportDescription;
  String? driveSupportFloorToCeilingMeasurementTopLanding;
  String? driveSupportOverheadCarClearanceMeasurement;
  String? driveSupportTopOfCounterweightClearance;
  String? driveSupportTopNormalTerminal;
  String? driveSupportTopFinalTerminal;
  String? driveSupportGovernorGuard;
  String? driveSupportSheaveGuard;
  String? driveSupportGovernorType;
  String? driveSupportGovernorCondition;
  String? driveSupportWhy;
  String? driveSupportGovernorLocation;
  String? driveSupportBaleFlip;
  String? driveSupportGovernorSwitch;
  String? driveSupportTrippingSpeed;
  String? driveSupportRopeGripper;
  String? driveSupportRopeGripperCondition;
  String? driveSupportSheaveBreak;
  String? driveSupportSheaveBreakCondition;
  String? driveSupportSheaveBreakConditionOther;
  String? driveSupportTypeOfBushing;
  String? driveSupportTractionSheaveBushingSize;
  String? driveSupportTractionSheaveType;
  String? driveSupportTractionSheaveCondition;
  String? driveSupportShaftSize;
  String? driveSupportBearingType;
  String? driveSupportBearingSize;
  String? driveSupportDeflectorSheave;
  String? driveSupportDeflectorSheaveShaftSize;
  String? driveSupportDeflectorSheaveBearingType;
  String? driveSupportDeflectorSheaveBearingSize;
  String? driveSupportShaftAndBearingCondition;
  String? driveSupportCouplerSize;
  String? driveSupportCouplerType;
  String? driveSupportCouplerCondition;
  String? driveSupportGearboxBrandName;
  String? driveSupportGearboxNumbers;
  String? driveSupportGearboxCondition;
  String? driveSupportMotorBrandName;
  String? driveSupportMotorNumbers;
  String? driveSupportMotorCondition;
  String? driveSupportBrakeBrandName;
  String? driveSupportBrakeNumbers;
  String? driveSupportBrakeCondition;
  String? driveSupportHeadDriveMeasurements;
  String? driveSupportOrientationOfMotorComments;
  String? driveSupportOverallTravelHeight;
  String? driveSupportAccessToDrive;
  String? driveSupportMachineDisconnect;
  String? driveSupportOverheadLiftingSupports;
  String? driveSupportTopLandingComments;

  String? electricalNema;
  String? electricalVoltage;
  String? electricalControls;
  String? electricalLocation;
  String? electricalStarter;
  String? electricalControlRelay;
  String? electricalPhaseReversalRelay;
  String? electrical3PoleContactor;

  String? loadTestsPoundUsedDuringTest;
  String? loadTestsdidUnitPassLoadTest;
  String? loadTestSpeed;
  String? loadTestGovernorTrippedAt;
  CageInspection({
    this.bottomPlatform,
    this.pit,
    this.clean,
    this.pitSwitch,
    this.switchLocation,
    this.pitLight,
    this.pitLightSwitch,
    this.carBuffers,
    this.runbyCarBuffers,
    this.counterweightBuffers,
    this.runbyCounterweightBuffers,
    this.governorCableTensioner,
    this.conditionGovernorCableTensioner,
    this.bottomNormalTerminal,
    this.bottomFinalTerminal,
    this.pitComments,
    this.underCarSize,
    this.measurementFrom,
    this.frontBack,
    this.rightLeft,
    this.travelCableConnectionAndCondition,
    this.safetyType,
    this.safetyLocation,
    this.safetyCondition,
    this.switchOnSafeties,
    this.carGuideRailsType,
    this.carGuideRailsSize,
    this.carGuideRailsCondition,
    this.carGuideRailsWhy,
    this.carGuideRailsDbg,
    this.carGuideRailBrackets,
    this.carGuideType,
    this.carGuideCondition,
    this.counterweightLocationFacingCar,
    this.counterweightGuideRailType,
    this.counterweightGuideRailSize,
    this.counterweightGuideRailDbg,
    this.counterweightGuideRailCondition,
    this.counterweightGuideRailBrackets,
    this.cwDimension,
    this.cwMaterial,
    this.cwGuideType,
    this.cwCondition,
    this.hoistwayLadder,
    this.hoistwayControls,
    this.hoistwayDoor,
    this.hoistwayDoorUnlockingDevice,
    this.hoistwayDoorInterlockType,
    this.hoistwayDoorInterlockLocation,
    this.hoistwayDoorInterlockCondition,
    this.hoistwayDoorElectricContactType,
    this.hoistwayDoorElectricContactLocation,
    this.hoistwayDoorElectricContactCondition,
    this.hoistwayDoorHinge,
    this.hoistwayDoorSelfCloser,
    this.hoistwayDoorSigns,
    this.enclosure,
    this.enclosureMaterial,
    this.enclosurePanels,
    this.landingZoneSwitch,
    this.landingZoneSwitchCondition,
    this.landingComments,
    this.carConditionAndDescriptionCam,
    this.carConditionAndDescriptionLocation,
    this.carConditionAndDescriptionCondition,
    this.carDoorType,
    this.carDoorMaterial,
    this.carDoorCondition,
    this.carDoorLimit,
    this.carOperationControlsUp,
    this.carOperationControlsDown,
    this.carLight,
    this.carLightSwitch,
    this.carAlarm,
    this.carAlarmSwitch,
    this.emergencyStop,
    this.capacitySignage,
    this.commDevice,
    this.emergencyEscapeHatch,
    this.emergencyEscapeHatchSwitch,
    this.manualBackupCarAlarm,
    this.manualBackupCarAlarmType,
    this.dataPlate,
    this.typeOfCableAttachmentToCar,
    this.ccfHoistcableFastenersToCar,
    this.ccfNoOfFastenersPerCable,
    this.ccfHoistcableFastenersToCW,
    this.ccfHoistcableNumber,
    this.ccfHoistcableSize,
    this.ccfHoistcableCondition,
    this.ccfGovernorCableSize,
    this.ccfGovernorCableCondition,
    this.ccfGovernorCablefasteners,
    this.ccfGovernorReleaseType,
    this.ccfGovernorReleaseLocation,
    this.driveSupportDescription,
    this.driveSupportFloorToCeilingMeasurementTopLanding,
    this.driveSupportOverheadCarClearanceMeasurement,
    this.driveSupportTopOfCounterweightClearance,
    this.driveSupportTopNormalTerminal,
    this.driveSupportTopFinalTerminal,
    this.driveSupportGovernorGuard,
    this.driveSupportSheaveGuard,
    this.driveSupportGovernorType,
    this.driveSupportGovernorCondition,
    this.driveSupportWhy,
    this.driveSupportGovernorLocation,
    this.driveSupportBaleFlip,
    this.driveSupportGovernorSwitch,
    this.driveSupportTrippingSpeed,
    this.driveSupportRopeGripper,
    this.driveSupportRopeGripperCondition,
    this.driveSupportSheaveBreak,
    this.driveSupportSheaveBreakCondition,
    this.driveSupportTypeOfBushing,
    this.driveSupportTractionSheaveBushingSize,
    this.driveSupportTractionSheaveType,
    this.driveSupportTractionSheaveCondition,
    this.driveSupportShaftSize,
    this.driveSupportBearingType,
    this.driveSupportBearingSize,
    this.driveSupportDeflectorSheave,
    this.driveSupportDeflectorSheaveShaftSize,
    this.driveSupportDeflectorSheaveBearingType,
    this.driveSupportDeflectorSheaveBearingSize,
    this.driveSupportShaftAndBearingCondition,
    this.driveSupportCouplerSize,
    this.driveSupportCouplerType,
    this.driveSupportCouplerCondition,
    this.driveSupportGearboxBrandName,
    this.driveSupportGearboxNumbers,
    this.driveSupportGearboxCondition,
    this.driveSupportMotorBrandName,
    this.driveSupportMotorNumbers,
    this.driveSupportMotorCondition,
    this.driveSupportBrakeBrandName,
    this.driveSupportBrakeNumbers,
    this.driveSupportBrakeCondition,
    this.driveSupportHeadDriveMeasurements,
    this.driveSupportOrientationOfMotorComments,
    this.driveSupportOverallTravelHeight,
    this.driveSupportAccessToDrive,
    this.driveSupportMachineDisconnect,
    this.driveSupportOverheadLiftingSupports,
    this.driveSupportTopLandingComments,
    this.electricalNema,
    this.electricalVoltage,
    this.electricalControls,
    this.electricalLocation,
    this.electricalStarter,
    this.electricalControlRelay,
    this.electricalPhaseReversalRelay,
    this.electrical3PoleContactor,
    this.loadTestsPoundUsedDuringTest,
    this.loadTestsdidUnitPassLoadTest,
    this.loadTestSpeed,
    this.loadTestGovernorTrippedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'bottomPlatform': bottomPlatform,
      'pit': pit,
      'clean': clean,
      'pitSwitch': pitSwitch,
      'switchLocation': switchLocation,
      'pitLight': pitLight,
      'pitLightSwitch': pitLightSwitch,
      'carBuffers': carBuffers,
      'runbyCarBuffers': runbyCarBuffers,
      'counterweightBuffers': counterweightBuffers,
      'runbyCounterweightBuffers': runbyCounterweightBuffers,
      'governorCableTensioner': governorCableTensioner,
      'conditionGovernorCableTensioner': conditionGovernorCableTensioner,
      'bottomNormalTerminal': bottomNormalTerminal,
      'bottomFinalTerminal': bottomFinalTerminal,
      'pitComments': pitComments,
      'underCarSize': underCarSize,
      'measurementFrom': measurementFrom,
      'frontBack': frontBack,
      'rightLeft': rightLeft,
      'travelCableConnectionAndCondition': travelCableConnectionAndCondition,
      'safetyType': safetyType,
      'safetyLocation': safetyLocation,
      'safetyCondition': safetyCondition,
      'switchOnSafeties': switchOnSafeties,
      'carGuideRailsType': carGuideRailsType,
      'carGuideRailsSize': carGuideRailsSize,
      'carGuideRailsCondition': carGuideRailsCondition,
      'carGuideRailsWhy': carGuideRailsWhy,
      'carGuideRailsDbg': carGuideRailsDbg,
      'carGuideRailBrackets': carGuideRailBrackets,
      'carGuideType': carGuideType,
      'carGuideCondition': carGuideCondition,
      'counterweightLocationFacingCar': counterweightLocationFacingCar,
      'counterweightGuideRailType': counterweightGuideRailType,
      'counterweightGuideRailSize': counterweightGuideRailSize,
      'counterweightGuideRailDbg': counterweightGuideRailDbg,
      'counterweightGuideRailCondition': counterweightGuideRailCondition,
      'counterweightGuideRailBrackets': counterweightGuideRailBrackets,
      'cwDimension': cwDimension,
      'cwMaterial': cwMaterial,
      'cwGuideType': cwGuideType,
      'cwCondition': cwCondition,
      'hoistwayLadder': hoistwayLadder,
      'hoistwayControls': hoistwayControls,
      'hoistwayDoor': hoistwayDoor,
      'hoistwayDoorUnlockingDevice': hoistwayDoorUnlockingDevice,
      'hoistwayDoorInterlockType': hoistwayDoorInterlockType,
      'hoistwayDoorInterlockLocation': hoistwayDoorInterlockLocation,
      'hoistwayDoorInterlockCondition': hoistwayDoorInterlockCondition,
      'hoistwayDoorElectricContactType': hoistwayDoorElectricContactType,
      'hoistwayDoorElectricContactLocation':
          hoistwayDoorElectricContactLocation,
      'hoistwayDoorElectricContactCondition':
          hoistwayDoorElectricContactCondition,
      'hoistwayDoorHinge': hoistwayDoorHinge,
      'hoistwayDoorSelfCloser': hoistwayDoorSelfCloser,
      'hoistwayDoorSigns': hoistwayDoorSigns,
      'enclosure': enclosure,
      'enclosureMaterial': enclosureMaterial,
      'enclosurePanels': enclosurePanels,
      'landingZoneSwitch': landingZoneSwitch,
      'landingZoneSwitchCondition': landingZoneSwitchCondition,
      'landingComments': landingComments,
      'carConditionAndDescriptionCam': carConditionAndDescriptionCam,
      'carConditionAndDescriptionLocation': carConditionAndDescriptionLocation,
      'carConditionAndDescriptionCondition':
          carConditionAndDescriptionCondition,
      'carDoorType': carDoorType,
      'carDoorMaterial': carDoorMaterial,
      'carDoorCondition': carDoorCondition,
      'carDoorLimit': carDoorLimit,
      'carOperationControlsUp': carOperationControlsUp,
      'carOperationControlsDown': carOperationControlsDown,
      'carLight': carLight,
      'carLightSwitch': carLightSwitch,
      'carAlarm': carAlarm,
      'carAlarmSwitch': carAlarmSwitch,
      'emergencyStop': emergencyStop,
      'capacitySignage': capacitySignage,
      'commDevice': commDevice,
      'emergencyEscapeHatch': emergencyEscapeHatch,
      'emergencyEscapeHatchSwitch': emergencyEscapeHatchSwitch,
      'manualBackupCarAlarm': manualBackupCarAlarm,
      'manualBackupCarAlarmType': manualBackupCarAlarmType,
      'dataPlate': dataPlate,
      'typeOfCableAttachmentToCar': typeOfCableAttachmentToCar,
      'ccfHoistcableFastenersToCar': ccfHoistcableFastenersToCar,
      'ccfNoOfFastenersPerCable': ccfNoOfFastenersPerCable,
      'ccfHoistcableFastenersToCW': ccfHoistcableFastenersToCW,
      'ccfHoistcableNumber': ccfHoistcableNumber,
      'ccfHoistcableSize': ccfHoistcableSize,
      'ccfHoistcableCondition': ccfHoistcableCondition,
      'ccfGovernorCableSize': ccfGovernorCableSize,
      'ccfGovernorCableCondition': ccfGovernorCableCondition,
      'ccfGovernorCablefasteners': ccfGovernorCablefasteners,
      'ccfGovernorReleaseType': ccfGovernorReleaseType,
      'ccfGovernorReleaseLocation': ccfGovernorReleaseLocation,
      'driveSupportDescription': driveSupportDescription,
      'driveSupportFloorToCeilingMeasurementTopLanding':
          driveSupportFloorToCeilingMeasurementTopLanding,
      'driveSupportOverheadCarClearanceMeasurement':
          driveSupportOverheadCarClearanceMeasurement,
      'driveSupportTopOfCounterweightClearance':
          driveSupportTopOfCounterweightClearance,
      'driveSupportTopNormalTerminal': driveSupportTopNormalTerminal,
      'driveSupportTopFinalTerminal': driveSupportTopFinalTerminal,
      'driveSupportGovernorGuard': driveSupportGovernorGuard,
      'driveSupportSheaveGuard': driveSupportSheaveGuard,
      'driveSupportGovernorType': driveSupportGovernorType,
      'driveSupportGovernorCondition': driveSupportGovernorCondition,
      'driveSupportWhy': driveSupportWhy,
      'driveSupportGovernorLocation': driveSupportGovernorLocation,
      'driveSupportBaleFlip': driveSupportBaleFlip,
      'driveSupportGovernorSwitch': driveSupportGovernorSwitch,
      'driveSupportTrippingSpeed': driveSupportTrippingSpeed,
      'driveSupportRopeGripper': driveSupportRopeGripper,
      'driveSupportRopeGripperCondition': driveSupportRopeGripperCondition,
      'driveSupportSheaveBreak': driveSupportSheaveBreak,
      'driveSupportSheaveBreakCondition': driveSupportSheaveBreakCondition,
      'driveSupportTypeOfBushing': driveSupportTypeOfBushing,
      'driveSupportTractionSheaveBushingSize':
          driveSupportTractionSheaveBushingSize,
      'driveSupportTractionSheaveType': driveSupportTractionSheaveType,
      'driveSupportTractionSheaveCondition':
          driveSupportTractionSheaveCondition,
      'driveSupportShaftSize': driveSupportShaftSize,
      'driveSupportBearingType': driveSupportBearingType,
      'driveSupportBearingSize': driveSupportBearingSize,
      'driveSupportDeflectorSheave': driveSupportDeflectorSheave,
      'driveSupportDeflectorSheaveShaftSize':
          driveSupportDeflectorSheaveShaftSize,
      'driveSupportDeflectorSheaveBearingType':
          driveSupportDeflectorSheaveBearingType,
      'driveSupportDeflectorSheaveBearingSize':
          driveSupportDeflectorSheaveBearingSize,
      'driveSupportShaftAndBearingCondition':
          driveSupportShaftAndBearingCondition,
      'driveSupportCouplerSize': driveSupportCouplerSize,
      'driveSupportCouplerType': driveSupportCouplerType,
      'driveSupportCouplerCondition': driveSupportCouplerCondition,
      'driveSupportGearboxBrandName': driveSupportGearboxBrandName,
      'driveSupportGearboxNumbers': driveSupportGearboxNumbers,
      'driveSupportGearboxCondition': driveSupportGearboxCondition,
      'driveSupportMotorBrandName': driveSupportMotorBrandName,
      'driveSupportMotorNumbers': driveSupportMotorNumbers,
      'driveSupportMotorCondition': driveSupportMotorCondition,
      'driveSupportBrakeBrandName': driveSupportBrakeBrandName,
      'driveSupportBrakeNumbers': driveSupportBrakeNumbers,
      'driveSupportBrakeCondition': driveSupportBrakeCondition,
      'driveSupportHeadDriveMeasurements': driveSupportHeadDriveMeasurements,
      'driveSupportOrientationOfMotorComments':
          driveSupportOrientationOfMotorComments,
      'driveSupportOverallTravelHeight': driveSupportOverallTravelHeight,
      'driveSupportAccessToDrive': driveSupportAccessToDrive,
      'driveSupportMachineDisconnect': driveSupportMachineDisconnect,
      'driveSupportOverheadLiftingSupports':
          driveSupportOverheadLiftingSupports,
      'driveSupportTopLandingComments': driveSupportTopLandingComments,
      'electricalNema': electricalNema,
      'electricalVoltage': electricalVoltage,
      'electricalControls': electricalControls,
      'electricalLocation': electricalLocation,
      'electricalStarter': electricalStarter,
      'electricalControlRelay': electricalControlRelay,
      'electricalPhaseReversalRelay': electricalPhaseReversalRelay,
      'electrical3PoleContactor': electrical3PoleContactor,
      'loadTestsPoundUsedDuringTest': loadTestsPoundUsedDuringTest,
      'loadTestsdidUnitPassLoadTest': loadTestsdidUnitPassLoadTest,
      'loadTestSpeed': loadTestSpeed,
      'loadTestGovernorTrippedAt': loadTestGovernorTrippedAt,
    };
  }
}
