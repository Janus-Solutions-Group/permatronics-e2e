import 'dart:convert';

class BeltInspection {
  // Tail Section Foot Assembly Variables
  String? tailSectionFootAssemblyLegCondition;
  String? tailSectionFootAssemblyLegAnchors;
  String? tailSectionFootAssemblyLegAnchorsCondition;
  String? tailSectionFootAssemblyLegsAnchoredTo;
  String? tailSectionFootAssemblyBottomCircleType;
  String? tailSectionFootAssemblyBottomCircleCondition;
  String? tailSectionFootAssemblyBottomBearings;
  String? tailSectionFootAssemblyBottomBearingsCondition;
  String? tailSectionFootAssemblyBearingHousingCondition;
  String? tailSectionFootAssemblyFootShaftDiameter;
  String? tailSectionFootAssemblyFootShaftLength;
  String? tailSectionFootAssemblyFootShaftCondition;
  String? tailSectionFootAssemblyDoesFootShaftHaveKey;
  String? tailSectionFootAssemblyDoesFootShaftHaveBushing;
  String? tailSectionFootAssemblyDoesFootShaftHaveSetScrews;
  String? tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft;
  String? tailSectionFootAssemblyFootPulleyCondition;
  String? tailSectionFootAssemblyTypeOfBeltAdjustment;
  String? tailSectionFootAssemblyIsFootPulleyCentered;
  String? tailSectionFootAssemblyBeltTracking;
  String? tailSectionFootAssemblyDebrisDeflector;
  String? tailSectionFootAssemblyDebrisDeflectorCondition;
  String? tailSectionFootAssemblyRopeSheaves;
  String? tailSectionFootAssemblyRopeSheavesCondition;
  String? tailSectionFootAssemblyYokeAssembly;
  String? tailSectionFootAssemblyComments;

  // Bottom Landing Safeties Variables
  String? bottomLandingSafetiesType1;
  String? bottomLandingSafetiesType1Condition;
  String? bottomLandingSafetiesType2;
  String? bottomLandingSafetiesType2Location;
  String? bottomLandingSafetiesType2Condition;
  String? bottomLandingSafetiesType3;
  String? bottomLandingSafetiesType3Location;
  String? bottomLandingSafetiesType3Condition;
  String? bottomLandingSafetiesBottomReset;
  String? bottomLandingSafetiesBottomResetLocation;
  String? bottomLandingSafetiesBottomResetCompliant;
  String? bottomLandingSafetiesBottomResetCondition;
  String? bottomLandingSafetiesVisualAudibleAlertingSystem;
  String? bottomLandingSafetiesBottomSafetiesComments;
  String? bottomLandingAuthorizedPersonnelOnlySign;
  String? bottomLandingInstructionSign;
  String? bottomLandingBottomFloorGetOffSign;
  String? bottomLandingBottomFloorGetOffSignLocation;
  String? bottomLandingRedWarningLight;
  String? bottomLandingLightLocation;
  String? bottomLandingIsManliftInABelowGradePit;
  String? bottomLandingManliftClean;
  String? bottomLandingDoesManliftUseUpSidePlatform;
  String? bottomLandingDescribeOpening;
  String? bottomLandingIsStepLevelAfterCompletingTurn;
  String? bottomLandingDistanceFromFloorOpeningToGuardRailUpSide;
  String? bottomLandingDoesManliftUseDownSidePlatform;
  String?
      bottomLandingIsThereAWallInFrontOfDismountPlatformWithin48FromFaceOfBelt;
  String? bottomLandingDistanceFromFloorOpeningToGuardRailDownSide;
  String? bottomLandingLadderRungs;
  String? bottomLandingDistanceBetweenRungs;
  String? bottomLandingLadderRungsCondition;
  String? bottomLandingMaze;
  String? bottomLandingSelfClosingGates;
  String? bottomLandingAreGatesSelfClosing;
  String? bottomLandingOpenOutward;
  String? bottomLandingAreGatesMissing;
  String? bottomLandingToeboard;
  String? bottomLandingAddToeboard;
  String? bottomLandingToeboardHeight;
  String? bottomLandingDistanceFromFaceOfBeltToBackEdgeOfFloorOpening;
  String? bottomLandingBottomLandingNotesComments;
  String? bottomLandingHoodTypeOfHood;
  String? bottomLandingHoodHoodCondition;
  String? bottomLandingHoodHoodClearance;
  String? bottomLandingHoodIfStationaryDistanceFromFaceOfBelt;
  String? bottomLandingHoodAngleOfSlope;
  String? bottomLandingHoodShape;
  String? bottomLandingHoodIfMoveableWhatTypeOfSwitch;
  String? bottomLandingHoodLocationOfHinges;
  String? bottomLandingHoodCounterweighted;
  String? bottomLandingHoodDoesHoodHaveARolledEdge;
  String? bottomLandingHoodIfMoveableDoesTheSwitchWork;
  String? bottomLandingHoodConditionOfRolledEdge;
  String? bottomLandingHoodBottomHoodComments;

  // Belting Variables
  String? beltingBeltingType;
  String? beltingBeltingCondition;
  String? beltingWidth;
  String? beltingColor;
  String? beltingSpliceType;
  String? beltingSpliceLength;
  String? beltingNumberOfBolts;
  String? beltingMissingBolts;
  String? beltingMissingBoltsNumber;
  String? beltingSpliceBoltCondition;
  String? beltingInstructionsStenciledOnTheBelt;
  String? beltingDirectionalArrowsStenciledOnTheBelt;
  String? beltingCompressiveFlexFailure;
  String? beltingTensionOfBelt;
  String? beltingBeltConditionComments;

  // Handholds Variables
  String? handholdsHandholdType;
  String? handholdsHandholdColor;
  String? handholdsNumberOfHandholds;
  String? handholdsDepth;
  String? handholdsDistanceFromBelt;
  String? handholdsDistanceFromStep;
  String? handholdsPunchingPattern;
  String? handholdsConditionOfBolts;
  String? handholdsHandholdComments;

  // Steps Variables
  String? stepsStepDescription;
  String? stepsNumberOfSteps;
  String? stepsStepsMissing;
  String? stepsMissingStepsNumber;
  String? stepsTreadColor;
  String? stepsNumberOfStepBarBolts;
  String? stepsConditionOfElevatorBolts;
  String? stepsMissingBolts;
  String? stepsMissingStepBolts;
  String? stepsStepBarBoltHolePattern;
  String? stepsStepBarToStepBarCenters;
  String? stepsStepRollerType;
  String? stepsStepRollerCondition;
  String? stepsStepRollersBolts;
  String? stepsStepTreadMaterial;
  String? stepsConditionOfStepTreads;
  String? stepsAntiSkid;
  String? stepsConditionOfAntiSkid;
  String? stepsStepPinsAndXyWasher;
  String? stepsConditionOfStepPinsAndXyWasher;
  String? stepsStepBracketsCondition;
  String? stepsStepBarsCondition;
  String? stepsStepComments;

  // Int?ermediate Landing Variables
  String? intermediateLandingNumber;
  String? intermediateLandingAuthorizedPersonnelSign;
  String? intermediateLandingInstructionSign;
  String? intermediateLandingFloorOpeningShape;
  String? intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideBack;
  String? intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideLeft;
  String? intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight;
  String? intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideBack;
  String? intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideLeft;
  String? intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideRight;
  String? intermediateLandingMaze;
  String? intermediateLandingSelfClosingGates;
  String? intermediateLandingAreGatesSelfClosing;
  String? intermediateLandingOpenOutward;
  String? intermediateLandingAreGatesMissing;
  String? intermediateLandingToeboard;
  String? intermediateLandingAddlToeboard;
  String? intermediateLandingHoodCondition;
  String? intermediateLandingHoodClearance;
  String? intermediateLandingAngleOfSlope;
  String? intermediateLandingDoesHoodHaveRolledEdge;
  String? intermediateLandingConditionOfRolledEdge;
  String? intermediateLandingLadderRungs;
  String? intermediateLandingTensionOfBelt;
  String? intermediateLandingConditionOfRopeGuides;
  String? intermediateLandingNeedAddlRopeGuides;
  String? intermediateLandingLighting;
  String? intermediateLandingIsLandingClean;
  String? intermediateLandingLateralBracing;
  String? intermediateLandingCheckAttachmentBolts;
  String? intermediateLandingAreAttachmentsInPlace;

  // Top Landing Variables
  String? topLandingNumber;
  String? topLandingAuthorizedPersonnelSign;
  String? topLandingInstructionSign;
  String? topLandingFloorOpeningShape;
  String? topLandingDistanceFromFloorOpeningToGuardRailUpSideBack;
  String? topLandingDistanceFromFloorOpeningToGuardRailUpSideLeft;
  String? topLandingDistanceFromFloorOpeningToGuardRailUpSideRight;
  String? topLandingDistanceFromFloorOpeningToGuardRailDownSideBack;
  String? topLandingDistanceFromFloorOpeningToGuardRailDownSideLeft;
  String? topLandingDistanceFromFloorOpeningToGuardRailDownSideRight;
  String? topLandingMaze;
  String? topLandingSelfClosingGates;
  String? topLandingAreGatesSelfClosing;
  String? topLandingOpenOutward;
  String? topLandingAreGatesMissing;
  String? topLandingToeboard;
  String? topLandingAddlToeboard;
  String? topLandingHoodCondition;
  String? topLandingHoodClearance;
  String? topLandingAngleOfSlope;
  String? topLandingDoesHoodHaveRolledEdge;
  String? topLandingConditionOfRolledEdge;
  String? topLandingLadderRungs;
  String? topLandingTensionOfBelt;
  String? topLandingConditionOfRopeGuides;
  String? topLandingNeedAddlRopeGuides;
  String? topLandingLighting;
  String? topLandingIsLandingClean;
  String? topLandingLateralBracing;
  String? topLandingCheckAttachmentBolts;
  String? topLandingAreAttachmentsInPlace;

  // Drive Assembly Variables
  String? driveAssemblyHeadCircleType;
  String? driveAssemblyCircleCondition;
  String? driveAssemblyBeltTracking;
  String? driveAssemblyLaggingCondition;
  String? driveAssemblyFasteningMethod;
  String? driveAssemblyHeadShaftBearingNumber;
  String? driveAssemblyHeadShaftBearingType;
  String? driveAssemblyHeadShaftBearingSize;
  String? driveAssemblyBearingCondition;
  String? driveAssemblyHeadShaftDiameter;
  String? driveAssemblyHeadShaftLength;
  String? driveAssemblyKey;
  String? driveAssemblyBushings;
  String? driveAssemblySetScrews;
  String? driveAssemblyShaftCondition;
  String? driveAssemblyHeadPulleyType;
  String? driveAssemblyPulleySize;
  String? driveAssemblyPulleyCondition;
  String? driveAssemblyIsHeadPulleyCentered;
  String? driveAssemblyIsHeadPulleyLevel;
  String? driveAssemblyCouplerType;
  String? driveAssemblyCouplerCondition;
  String? driveAssemblyGearboxType;
  String? driveAssemblyGearboxCondition;
  String? driveAssemblyMotorType;
  String? driveAssemblyMotorId;
  String? driveAssemblyHp;
  String? driveAssemblyVoltage;
  String? driveAssemblyBrakeType;
  String? driveAssemblyBrakeId;
  String? driveAssemblyFtLbs;
  String? driveAssemblyIsDriveSkip;
  String? driveAssemblySkipReason;
  String? driveAssemblySafTStopBrake;
  String? driveAssemblySafTStopLinkage;
  String? driveAssemblyOverallSafTStopCondition;
  String? driveAssemblyDriveSupportType;
  String? driveAssemblyDriveComments;
  String? driveAssemblyTopLandingSafetiesType1;
  String? driveAssemblyTopLandingSafetiesType1Condition;
  String? driveAssemblyTopLandingSafetiesType2;
  String? driveAssemblyTopLandingSafetiesType2Location;
  String? driveAssemblyTopLandingSafetiesType2Condition;
  String? driveAssemblyTopLandingSafetiesType3Condition;
  String? driveAssemblyTopLandingSafetiesType3Location;
  String? driveAssemblyTopLandingSafetiesType3;
  String? driveAssemblyTopLandingSafetiesType4Condition;
  String? driveAssemblyTopLandingSafetiesType4Location;
  String? driveAssemblyTopLandingSafetiesType4;
  String? driveAssemblyTopLandingSafetiesTopReset;
  String? driveAssemblyTopLandingSafetiesTopResetLocation;
  String? driveAssemblyTopLandingSafetiesTopResetCompliant;
  String? driveAssemblyTopLandingSafetiesTopResetCondition;
  String? driveAssemblyTopLandingSafetiesSafetyDeviceSwitches;
  String? driveAssemblyTopLandingSafetiesHasAlertingSystem;
  String? driveAssemblyTopLandingSafetiesComments;

  // Electrical Variables
  String? electricalNemaType;
  String? electricalVoltage;
  String? electricalHasControlPanel;
  String? electricalControlPanelLocation;
  String? electricalIndividualControlLocation;
  String? electricalHasStarter;
  String? electricalHasControlRelay;
  String? electricalHasPhaseReversalRelay;
  String? electricalHas3PoleContactor;

  // Load Test Variables
  String? loadTestTestResult;
  String? loadTestWeightUsed;
  String? loadTestStoppingDistance;
  String? loadTestBeltManliftSpeed;

  BeltInspection({
    this.tailSectionFootAssemblyLegCondition,
    this.tailSectionFootAssemblyLegAnchors,
    this.tailSectionFootAssemblyLegAnchorsCondition,
    this.tailSectionFootAssemblyLegsAnchoredTo,
    this.tailSectionFootAssemblyBottomCircleType,
    this.tailSectionFootAssemblyBottomCircleCondition,
    this.tailSectionFootAssemblyBottomBearings,
    this.tailSectionFootAssemblyBottomBearingsCondition,
    this.tailSectionFootAssemblyBearingHousingCondition,
    this.tailSectionFootAssemblyFootShaftDiameter,
    this.tailSectionFootAssemblyFootShaftLength,
    this.tailSectionFootAssemblyFootShaftCondition,
    this.tailSectionFootAssemblyDoesFootShaftHaveKey,
    this.tailSectionFootAssemblyDoesFootShaftHaveBushing,
    this.tailSectionFootAssemblyDoesFootShaftHaveSetScrews,
    this.tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft,
    this.tailSectionFootAssemblyFootPulleyCondition,
    this.tailSectionFootAssemblyTypeOfBeltAdjustment,
    this.tailSectionFootAssemblyIsFootPulleyCentered,
    this.tailSectionFootAssemblyBeltTracking,
    this.tailSectionFootAssemblyDebrisDeflector,
    this.tailSectionFootAssemblyDebrisDeflectorCondition,
    this.tailSectionFootAssemblyRopeSheaves,
    this.tailSectionFootAssemblyRopeSheavesCondition,
    this.tailSectionFootAssemblyYokeAssembly,
    this.tailSectionFootAssemblyComments,
    this.bottomLandingSafetiesType1,
    this.bottomLandingSafetiesType1Condition,
    this.bottomLandingSafetiesType2,
    this.bottomLandingSafetiesType2Location,
    this.bottomLandingSafetiesType2Condition,
    this.bottomLandingSafetiesType3,
    this.bottomLandingSafetiesType3Location,
    this.bottomLandingSafetiesType3Condition,
    this.bottomLandingSafetiesBottomReset,
    this.bottomLandingSafetiesBottomResetLocation,
    this.bottomLandingSafetiesBottomResetCompliant,
    this.bottomLandingSafetiesBottomResetCondition,
    this.bottomLandingSafetiesVisualAudibleAlertingSystem,
    this.bottomLandingSafetiesBottomSafetiesComments,
    this.bottomLandingAuthorizedPersonnelOnlySign,
    this.bottomLandingInstructionSign,
    this.bottomLandingBottomFloorGetOffSign,
    this.bottomLandingBottomFloorGetOffSignLocation,
    this.bottomLandingRedWarningLight,
    this.bottomLandingLightLocation,
    this.bottomLandingIsManliftInABelowGradePit,
    this.bottomLandingManliftClean,
    this.bottomLandingDoesManliftUseUpSidePlatform,
    this.bottomLandingDescribeOpening,
    this.bottomLandingIsStepLevelAfterCompletingTurn,
    this.bottomLandingDistanceFromFloorOpeningToGuardRailUpSide,
    this.bottomLandingDoesManliftUseDownSidePlatform,
    this.bottomLandingDistanceFromFloorOpeningToGuardRailDownSide,
    this.bottomLandingLadderRungs,
    this.bottomLandingDistanceBetweenRungs,
    this.bottomLandingLadderRungsCondition,
    this.bottomLandingMaze,
    this.bottomLandingSelfClosingGates,
    this.bottomLandingAreGatesSelfClosing,
    this.bottomLandingOpenOutward,
    this.bottomLandingAreGatesMissing,
    this.bottomLandingToeboard,
    this.bottomLandingAddToeboard,
    this.bottomLandingToeboardHeight,
    this.bottomLandingDistanceFromFaceOfBeltToBackEdgeOfFloorOpening,
    this.bottomLandingBottomLandingNotesComments,
    this.bottomLandingHoodTypeOfHood,
    this.bottomLandingHoodHoodCondition,
    this.bottomLandingHoodHoodClearance,
    this.bottomLandingHoodIfStationaryDistanceFromFaceOfBelt,
    this.bottomLandingIsThereAWallInFrontOfDismountPlatformWithin48FromFaceOfBelt,
    this.bottomLandingHoodAngleOfSlope,
    this.bottomLandingHoodShape,
    this.bottomLandingHoodIfMoveableWhatTypeOfSwitch,
    this.bottomLandingHoodLocationOfHinges,
    this.bottomLandingHoodCounterweighted,
    this.bottomLandingHoodDoesHoodHaveARolledEdge,
    this.bottomLandingHoodIfMoveableDoesTheSwitchWork,
    this.bottomLandingHoodConditionOfRolledEdge,
    this.bottomLandingHoodBottomHoodComments,
    this.beltingBeltingType,
    this.beltingBeltingCondition,
    this.beltingWidth,
    this.beltingColor,
    this.beltingSpliceType,
    this.beltingSpliceLength,
    this.beltingNumberOfBolts,
    this.beltingMissingBolts,
    this.beltingMissingBoltsNumber,
    this.beltingSpliceBoltCondition,
    this.beltingInstructionsStenciledOnTheBelt,
    this.beltingDirectionalArrowsStenciledOnTheBelt,
    this.beltingCompressiveFlexFailure,
    this.beltingTensionOfBelt,
    this.beltingBeltConditionComments,
    this.handholdsHandholdType,
    this.handholdsHandholdColor,
    this.handholdsNumberOfHandholds,
    this.handholdsDepth,
    this.handholdsDistanceFromBelt,
    this.handholdsDistanceFromStep,
    this.handholdsPunchingPattern,
    this.handholdsConditionOfBolts,
    this.handholdsHandholdComments,
    this.stepsStepDescription,
    this.stepsNumberOfSteps,
    this.stepsStepsMissing,
    this.stepsMissingStepsNumber,
    this.stepsTreadColor,
    this.stepsNumberOfStepBarBolts,
    this.stepsConditionOfElevatorBolts,
    this.stepsMissingBolts,
    this.stepsMissingStepBolts,
    this.stepsStepBarBoltHolePattern,
    this.stepsStepBarToStepBarCenters,
    this.stepsStepRollerType,
    this.stepsStepRollerCondition,
    this.stepsStepRollersBolts,
    this.stepsStepTreadMaterial,
    this.stepsConditionOfStepTreads,
    this.stepsAntiSkid,
    this.stepsConditionOfAntiSkid,
    this.stepsStepPinsAndXyWasher,
    this.stepsConditionOfStepPinsAndXyWasher,
    this.stepsStepBracketsCondition,
    this.stepsStepBarsCondition,
    this.stepsStepComments,
    this.intermediateLandingNumber,
    this.intermediateLandingAuthorizedPersonnelSign,
    this.intermediateLandingInstructionSign,
    this.intermediateLandingFloorOpeningShape,
    this.intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideBack,
    this.intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideLeft,
    this.intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight,
    this.intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideBack,
    this.intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideLeft,
    this.intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideRight,
    this.intermediateLandingMaze,
    this.intermediateLandingSelfClosingGates,
    this.intermediateLandingAreGatesSelfClosing,
    this.intermediateLandingOpenOutward,
    this.intermediateLandingAreGatesMissing,
    this.intermediateLandingToeboard,
    this.intermediateLandingAddlToeboard,
    this.intermediateLandingHoodCondition,
    this.intermediateLandingHoodClearance,
    this.intermediateLandingAngleOfSlope,
    this.intermediateLandingDoesHoodHaveRolledEdge,
    this.intermediateLandingConditionOfRolledEdge,
    this.intermediateLandingLadderRungs,
    this.intermediateLandingTensionOfBelt,
    this.intermediateLandingConditionOfRopeGuides,
    this.intermediateLandingNeedAddlRopeGuides,
    this.intermediateLandingLighting,
    this.intermediateLandingIsLandingClean,
    this.intermediateLandingLateralBracing,
    this.intermediateLandingCheckAttachmentBolts,
    this.intermediateLandingAreAttachmentsInPlace,
    this.topLandingNumber,
    this.topLandingAuthorizedPersonnelSign,
    this.topLandingInstructionSign,
    this.topLandingFloorOpeningShape,
    this.topLandingDistanceFromFloorOpeningToGuardRailUpSideBack,
    this.topLandingDistanceFromFloorOpeningToGuardRailUpSideLeft,
    this.topLandingDistanceFromFloorOpeningToGuardRailUpSideRight,
    this.topLandingDistanceFromFloorOpeningToGuardRailDownSideBack,
    this.topLandingDistanceFromFloorOpeningToGuardRailDownSideLeft,
    this.topLandingDistanceFromFloorOpeningToGuardRailDownSideRight,
    this.topLandingMaze,
    this.topLandingSelfClosingGates,
    this.topLandingAreGatesSelfClosing,
    this.topLandingOpenOutward,
    this.topLandingAreGatesMissing,
    this.topLandingToeboard,
    this.topLandingAddlToeboard,
    this.topLandingHoodCondition,
    this.topLandingHoodClearance,
    this.topLandingAngleOfSlope,
    this.topLandingDoesHoodHaveRolledEdge,
    this.topLandingConditionOfRolledEdge,
    this.topLandingLadderRungs,
    this.topLandingTensionOfBelt,
    this.topLandingConditionOfRopeGuides,
    this.topLandingNeedAddlRopeGuides,
    this.topLandingLighting,
    this.topLandingIsLandingClean,
    this.topLandingLateralBracing,
    this.topLandingCheckAttachmentBolts,
    this.topLandingAreAttachmentsInPlace,
    this.driveAssemblyHeadCircleType,
    this.driveAssemblyCircleCondition,
    this.driveAssemblyBeltTracking,
    this.driveAssemblyLaggingCondition,
    this.driveAssemblyFasteningMethod,
    this.driveAssemblyHeadShaftBearingNumber,
    this.driveAssemblyHeadShaftBearingType,
    this.driveAssemblyHeadShaftBearingSize,
    this.driveAssemblyBearingCondition,
    this.driveAssemblyHeadShaftDiameter,
    this.driveAssemblyHeadShaftLength,
    this.driveAssemblyKey,
    this.driveAssemblyBushings,
    this.driveAssemblySetScrews,
    this.driveAssemblyShaftCondition,
    this.driveAssemblyHeadPulleyType,
    this.driveAssemblyPulleySize,
    this.driveAssemblyPulleyCondition,
    this.driveAssemblyIsHeadPulleyCentered,
    this.driveAssemblyIsHeadPulleyLevel,
    this.driveAssemblyCouplerType,
    this.driveAssemblyCouplerCondition,
    this.driveAssemblyGearboxType,
    this.driveAssemblyGearboxCondition,
    this.driveAssemblyMotorType,
    this.driveAssemblyMotorId,
    this.driveAssemblyHp,
    this.driveAssemblyVoltage,
    this.driveAssemblyBrakeType,
    this.driveAssemblyBrakeId,
    this.driveAssemblyFtLbs,
    this.driveAssemblyIsDriveSkip,
    this.driveAssemblySkipReason,
    this.driveAssemblySafTStopBrake,
    this.driveAssemblySafTStopLinkage,
    this.driveAssemblyOverallSafTStopCondition,
    this.driveAssemblyDriveSupportType,
    this.driveAssemblyDriveComments,
    this.driveAssemblyTopLandingSafetiesType1,
    this.driveAssemblyTopLandingSafetiesType1Condition,
    this.driveAssemblyTopLandingSafetiesType2,
    this.driveAssemblyTopLandingSafetiesType2Condition,
    this.driveAssemblyTopLandingSafetiesType2Location,
    this.driveAssemblyTopLandingSafetiesType3,
    this.driveAssemblyTopLandingSafetiesType3Location,
    this.driveAssemblyTopLandingSafetiesType3Condition,
    this.driveAssemblyTopLandingSafetiesType4,
    this.driveAssemblyTopLandingSafetiesType4Location,
    this.driveAssemblyTopLandingSafetiesType4Condition,
    this.driveAssemblyTopLandingSafetiesTopReset,
    this.driveAssemblyTopLandingSafetiesTopResetLocation,
    this.driveAssemblyTopLandingSafetiesTopResetCompliant,
    this.driveAssemblyTopLandingSafetiesTopResetCondition,
    this.driveAssemblyTopLandingSafetiesSafetyDeviceSwitches,
    this.driveAssemblyTopLandingSafetiesHasAlertingSystem,
    this.driveAssemblyTopLandingSafetiesComments,
    this.electricalNemaType,
    this.electricalVoltage,
    this.electricalHasControlPanel,
    this.electricalControlPanelLocation,
    this.electricalIndividualControlLocation,
    this.electricalHasStarter,
    this.electricalHasControlRelay,
    this.electricalHasPhaseReversalRelay,
    this.electricalHas3PoleContactor,
    this.loadTestTestResult,
    this.loadTestWeightUsed,
    this.loadTestStoppingDistance,
    this.loadTestBeltManliftSpeed,
  });

  Map<String, dynamic> toMap() {
    return {
      'tailSectionFootAssemblyLegCondition':
          tailSectionFootAssemblyLegCondition,
      'tailSectionFootAssemblyLegAnchors': tailSectionFootAssemblyLegAnchors,
      'tailSectionFootAssemblyLegAnchorsCondition':
          tailSectionFootAssemblyLegAnchorsCondition,
      'tailSectionFootAssemblyLegsAnchoredTo':
          tailSectionFootAssemblyLegsAnchoredTo,
      'tailSectionFootAssemblyBottomCircleType':
          tailSectionFootAssemblyBottomCircleType,
      'tailSectionFootAssemblyBottomCircleCondition':
          tailSectionFootAssemblyBottomCircleCondition,
      'tailSectionFootAssemblyBottomBearings':
          tailSectionFootAssemblyBottomBearings,
      'tailSectionFootAssemblyBottomBearingsCondition':
          tailSectionFootAssemblyBottomBearingsCondition,
      'tailSectionFootAssemblyBearingHousingCondition':
          tailSectionFootAssemblyBearingHousingCondition,
      'tailSectionFootAssemblyFootShaftDiameter':
          tailSectionFootAssemblyFootShaftDiameter,
      'tailSectionFootAssemblyFootShaftLength':
          tailSectionFootAssemblyFootShaftLength,
      'tailSectionFootAssemblyFootShaftCondition':
          tailSectionFootAssemblyFootShaftCondition,
      'tailSectionFootAssemblyDoesFootShaftHaveKey':
          tailSectionFootAssemblyDoesFootShaftHaveKey,
      'tailSectionFootAssemblyDoesFootShaftHaveBushing':
          tailSectionFootAssemblyDoesFootShaftHaveBushing,
      'tailSectionFootAssemblyDoesFootShaftHaveSetScrews':
          tailSectionFootAssemblyDoesFootShaftHaveSetScrews,
      'tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft':
          tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft,
      'tailSectionFootAssemblyFootPulleyCondition':
          tailSectionFootAssemblyFootPulleyCondition,
      'tailSectionFootAssemblyTypeOfBeltAdjustment':
          tailSectionFootAssemblyTypeOfBeltAdjustment,
      'tailSectionFootAssemblyIsFootPulleyCentered':
          tailSectionFootAssemblyIsFootPulleyCentered,
      'tailSectionFootAssemblyBeltTracking':
          tailSectionFootAssemblyBeltTracking,
      'tailSectionFootAssemblyDebrisDeflector':
          tailSectionFootAssemblyDebrisDeflector,
      'tailSectionFootAssemblyDebrisDeflectorCondition':
          tailSectionFootAssemblyDebrisDeflectorCondition,
      'tailSectionFootAssemblyRopeSheaves': tailSectionFootAssemblyRopeSheaves,
      'tailSectionFootAssemblyRopeSheavesCondition':
          tailSectionFootAssemblyRopeSheavesCondition,
      'tailSectionFootAssemblyYokeAssembly':
          tailSectionFootAssemblyYokeAssembly,
      'tailSectionFootAssemblyComments': tailSectionFootAssemblyComments,
      'bottomLandingSafetiesType1': bottomLandingSafetiesType1,
      'bottomLandingSafetiesType1Condition':
          bottomLandingSafetiesType1Condition,
      'bottomLandingSafetiesType2': bottomLandingSafetiesType2,
      'bottomLandingSafetiesType2Location': bottomLandingSafetiesType2Location,
      'bottomLandingSafetiesType2Condition':
          bottomLandingSafetiesType2Condition,
      'bottomLandingSafetiesType3': bottomLandingSafetiesType3,
      'bottomLandingSafetiesType3Location': bottomLandingSafetiesType3Location,
      'bottomLandingSafetiesType3Condition':
          bottomLandingSafetiesType3Condition,
      'bottomLandingSafetiesBottomReset': bottomLandingSafetiesBottomReset,
      'bottomLandingSafetiesBottomResetLocation':
          bottomLandingSafetiesBottomResetLocation,
      'bottomLandingSafetiesBottomResetCompliant':
          bottomLandingSafetiesBottomResetCompliant,
      'bottomLandingSafetiesBottomResetCondition':
          bottomLandingSafetiesBottomResetCondition,
      'bottomLandingSafetiesVisualAudibleAlertingSystem':
          bottomLandingSafetiesVisualAudibleAlertingSystem,
      'bottomLandingSafetiesBottomSafetiesComments':
          bottomLandingSafetiesBottomSafetiesComments,
      'bottomLandingAuthorizedPersonnelOnlySign':
          bottomLandingAuthorizedPersonnelOnlySign,
      'bottomLandingInstructionSign': bottomLandingInstructionSign,
      'bottomLandingBottomFloorGetOffSign': bottomLandingBottomFloorGetOffSign,
      'bottomLandingBottomFloorGetOffSignLocation':
          bottomLandingBottomFloorGetOffSignLocation,
      'bottomLandingRedWarningLight': bottomLandingRedWarningLight,
      'bottomLandingLightLocation': bottomLandingLightLocation,
      'bottomLandingIsManliftInABelowGradePit':
          bottomLandingIsManliftInABelowGradePit,
      'bottomLandingManliftClean': bottomLandingManliftClean,
      'bottomLandingDoesManliftUseUpSidePlatform':
          bottomLandingDoesManliftUseUpSidePlatform,
      'bottomLandingDescribeOpening': bottomLandingDescribeOpening,
      'bottomLandingIsStepLevelAfterCompletingTurn':
          bottomLandingIsStepLevelAfterCompletingTurn,
      'bottomLandingDistanceFromFloorOpeningToGuardRailUpSide':
          bottomLandingDistanceFromFloorOpeningToGuardRailUpSide,
      'bottomLandingDoesManliftUseDownSidePlatform':
          bottomLandingDoesManliftUseDownSidePlatform,
      'bottomLandingDistanceFromFloorOpeningToGuardRailDownSide':
          bottomLandingDistanceFromFloorOpeningToGuardRailDownSide,
      'bottomLandingLadderRungs': bottomLandingLadderRungs,
      'bottomLandingDistanceBetweenRungs': bottomLandingDistanceBetweenRungs,
      'bottomLandingLadderRungsCondition': bottomLandingLadderRungsCondition,
      'bottomLandingMaze': bottomLandingMaze,
      'bottomLandingSelfClosingGates': bottomLandingSelfClosingGates,
      'bottomLandingAreGatesSelfClosing': bottomLandingAreGatesSelfClosing,
      'bottomLandingOpenOutward': bottomLandingOpenOutward,
      'bottomLandingAreGatesMissing': bottomLandingAreGatesMissing,
      'bottomLandingToeboard': bottomLandingToeboard,
      'bottomLandingAddToeboard': bottomLandingAddToeboard,
      'bottomLandingToeboardHeight': bottomLandingToeboardHeight,
      'bottomLandingDistanceFromFaceOfBeltToBackEdgeOfFloorOpening':
          bottomLandingDistanceFromFaceOfBeltToBackEdgeOfFloorOpening,
      'bottomLandingBottomLandingNotesComments':
          bottomLandingBottomLandingNotesComments,
      'bottomLandingHoodTypeOfHood': bottomLandingHoodTypeOfHood,
      'bottomLandingHoodHoodCondition': bottomLandingHoodHoodCondition,
      'bottomLandingHoodHoodClearance': bottomLandingHoodHoodClearance,
      'bottomLandingHoodIfStationaryDistanceFromFaceOfBelt':
          bottomLandingHoodIfStationaryDistanceFromFaceOfBelt,
      'bottomLandingHoodAngleOfSlope': bottomLandingHoodAngleOfSlope,
      'bottomLandingHoodShape': bottomLandingHoodShape,
      'bottomLandingHoodIfMoveableWhatTypeOfSwitch':
          bottomLandingHoodIfMoveableWhatTypeOfSwitch,
      'bottomLandingHoodLocationOfHinges': bottomLandingHoodLocationOfHinges,
      'bottomLandingHoodCounterweighted': bottomLandingHoodCounterweighted,
      'bottomLandingHoodDoesHoodHaveARolledEdge':
          bottomLandingHoodDoesHoodHaveARolledEdge,
      'bottomLandingHoodIfMoveableDoesTheSwitchWork':
          bottomLandingHoodIfMoveableDoesTheSwitchWork,
      'bottomLandingHoodConditionOfRolledEdge':
          bottomLandingHoodConditionOfRolledEdge,
      'bottomLandingHoodBottomHoodComments':
          bottomLandingHoodBottomHoodComments,
      'beltingBeltingType': beltingBeltingType,
      'beltingBeltingCondition': beltingBeltingCondition,
      'beltingWidth': beltingWidth,
      'beltingColor': beltingColor,
      'beltingSpliceType': beltingSpliceType,
      'beltingSpliceLength': beltingSpliceLength,
      'beltingNumberOfBolts': beltingNumberOfBolts,
      'beltingMissingBolts': beltingMissingBolts,
      'beltingMissingBoltsNumber': beltingMissingBoltsNumber,
      'beltingSpliceBoltCondition': beltingSpliceBoltCondition,
      'beltingInstructionsStenciledOnTheBelt':
          beltingInstructionsStenciledOnTheBelt,
      'beltingDirectionalArrowsStenciledOnTheBelt':
          beltingDirectionalArrowsStenciledOnTheBelt,
      'beltingCompressiveFlexFailure': beltingCompressiveFlexFailure,
      'beltingTensionOfBelt': beltingTensionOfBelt,
      'beltingBeltConditionComments': beltingBeltConditionComments,
      'handholdsHandholdType': handholdsHandholdType,
      'handholdsHandholdColor': handholdsHandholdColor,
      'handholdsNumberOfHandholds': handholdsNumberOfHandholds,
      'handholdsDepth': handholdsDepth,
      'handholdsDistanceFromBelt': handholdsDistanceFromBelt,
      'handholdsDistanceFromStep': handholdsDistanceFromStep,
      'handholdsPunchingPattern': handholdsPunchingPattern,
      'handholdsConditionOfBolts': handholdsConditionOfBolts,
      'handholdsHandholdComments': handholdsHandholdComments,
      'stepsStepDescription': stepsStepDescription,
      'stepsNumberOfSteps': stepsNumberOfSteps,
      'stepsStepsMissing': stepsStepsMissing,
      'stepsMissingStepsNumber': stepsMissingStepsNumber,
      'stepsTreadColor': stepsTreadColor,
      'stepsNumberOfStepBarBolts': stepsNumberOfStepBarBolts,
      'stepsConditionOfElevatorBolts': stepsConditionOfElevatorBolts,
      'stepsMissingBolts': stepsMissingBolts,
      'stepsMissingStepBolts': stepsMissingStepBolts,
      'stepsStepBarBoltHolePattern': stepsStepBarBoltHolePattern,
      'stepsStepBarToStepBarCenters': stepsStepBarToStepBarCenters,
      'stepsStepRollerType': stepsStepRollerType,
      'stepsStepRollerCondition': stepsStepRollerCondition,
      'stepsStepRollersBolts': stepsStepRollersBolts,
      'stepsStepTreadMaterial': stepsStepTreadMaterial,
      'stepsConditionOfStepTreads': stepsConditionOfStepTreads,
      'stepsAntiSkid': stepsAntiSkid,
      'stepsConditionOfAntiSkid': stepsConditionOfAntiSkid,
      'stepsStepPinsAndXyWasher': stepsStepPinsAndXyWasher,
      'stepsConditionOfStepPinsAndXyWasher':
          stepsConditionOfStepPinsAndXyWasher,
      'stepsStepBracketsCondition': stepsStepBracketsCondition,
      'stepsStepBarsCondition': stepsStepBarsCondition,
      'stepsStepComments': stepsStepComments,
      'intermediateLandingNumber': intermediateLandingNumber,
      'intermediateLandingAuthorizedPersonnelSign':
          intermediateLandingAuthorizedPersonnelSign,
      'intermediateLandingInstructionSign': intermediateLandingInstructionSign,
      'intermediateLandingFloorOpeningShape':
          intermediateLandingFloorOpeningShape,
      'intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideBack':
          intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideBack,
      'intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideLeft':
          intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideLeft,
      'intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight':
          intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight,
      'intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideBack':
          intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideBack,
      'intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideLeft':
          intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideLeft,
      'intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideRight':
          intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideRight,
      'intermediateLandingMaze': intermediateLandingMaze,
      'intermediateLandingSelfClosingGates':
          intermediateLandingSelfClosingGates,
      'intermediateLandingAreGatesSelfClosing':
          intermediateLandingAreGatesSelfClosing,
      'intermediateLandingOpenOutward': intermediateLandingOpenOutward,
      'intermediateLandingAreGatesMissing': intermediateLandingAreGatesMissing,
      'intermediateLandingToeboard': intermediateLandingToeboard,
      'intermediateLandingAddlToeboard': intermediateLandingAddlToeboard,
      'intermediateLandingHoodCondition': intermediateLandingHoodCondition,
      'intermediateLandingHoodClearance': intermediateLandingHoodClearance,
      'intermediateLandingAngleOfSlope': intermediateLandingAngleOfSlope,
      'intermediateLandingDoesHoodHaveRolledEdge':
          intermediateLandingDoesHoodHaveRolledEdge,
      'intermediateLandingConditionOfRolledEdge':
          intermediateLandingConditionOfRolledEdge,
      'intermediateLandingLadderRungs': intermediateLandingLadderRungs,
      'intermediateLandingTensionOfBelt': intermediateLandingTensionOfBelt,
      'intermediateLandingConditionOfRopeGuides':
          intermediateLandingConditionOfRopeGuides,
      'intermediateLandingNeedAddlRopeGuides':
          intermediateLandingNeedAddlRopeGuides,
      'intermediateLandingLighting': intermediateLandingLighting,
      'intermediateLandingIsLandingClean': intermediateLandingIsLandingClean,
      'intermediateLandingLateralBracing': intermediateLandingLateralBracing,
      'intermediateLandingCheckAttachmentBolts':
          intermediateLandingCheckAttachmentBolts,
      'intermediateLandingAreAttachmentsInPlace':
          intermediateLandingAreAttachmentsInPlace,
      'topLandingNumber': topLandingNumber,
      'topLandingAuthorizedPersonnelSign': topLandingAuthorizedPersonnelSign,
      'topLandingInstructionSign': topLandingInstructionSign,
      'topLandingFloorOpeningShape': topLandingFloorOpeningShape,
      'topLandingDistanceFromFloorOpeningToGuardRailUpSideBack':
          topLandingDistanceFromFloorOpeningToGuardRailUpSideBack,
      'topLandingDistanceFromFloorOpeningToGuardRailUpSideLeft':
          topLandingDistanceFromFloorOpeningToGuardRailUpSideLeft,
      'topLandingDistanceFromFloorOpeningToGuardRailUpSideRight':
          topLandingDistanceFromFloorOpeningToGuardRailUpSideRight,
      'topLandingDistanceFromFloorOpeningToGuardRailDownSideBack':
          topLandingDistanceFromFloorOpeningToGuardRailDownSideBack,
      'topLandingDistanceFromFloorOpeningToGuardRailDownSideLeft':
          topLandingDistanceFromFloorOpeningToGuardRailDownSideLeft,
      'topLandingDistanceFromFloorOpeningToGuardRailDownSideRight':
          topLandingDistanceFromFloorOpeningToGuardRailDownSideRight,
      'topLandingMaze': topLandingMaze,
      'topLandingSelfClosingGates': topLandingSelfClosingGates,
      'topLandingAreGatesSelfClosing': topLandingAreGatesSelfClosing,
      'topLandingOpenOutward': topLandingOpenOutward,
      'topLandingAreGatesMissing': topLandingAreGatesMissing,
      'topLandingToeboard': topLandingToeboard,
      'topLandingAddlToeboard': topLandingAddlToeboard,
      'topLandingHoodCondition': topLandingHoodCondition,
      'topLandingHoodClearance': topLandingHoodClearance,
      'topLandingAngleOfSlope': topLandingAngleOfSlope,
      'topLandingDoesHoodHaveRolledEdge': topLandingDoesHoodHaveRolledEdge,
      'topLandingConditionOfRolledEdge': topLandingConditionOfRolledEdge,
      'topLandingLadderRungs': topLandingLadderRungs,
      'topLandingTensionOfBelt': topLandingTensionOfBelt,
      'topLandingConditionOfRopeGuides': topLandingConditionOfRopeGuides,
      'topLandingNeedAddlRopeGuides': topLandingNeedAddlRopeGuides,
      'topLandingLighting': topLandingLighting,
      'topLandingIsLandingClean': topLandingIsLandingClean,
      'topLandingLateralBracing': topLandingLateralBracing,
      'topLandingCheckAttachmentBolts': topLandingCheckAttachmentBolts,
      'topLandingAreAttachmentsInPlace': topLandingAreAttachmentsInPlace,
      'driveAssemblyHeadCircleType': driveAssemblyHeadCircleType,
      'driveAssemblyCircleCondition': driveAssemblyCircleCondition,
      'driveAssemblyBeltTracking': driveAssemblyBeltTracking,
      'driveAssemblyLaggingCondition': driveAssemblyLaggingCondition,
      'driveAssemblyFasteningMethod': driveAssemblyFasteningMethod,
      'driveAssemblyHeadShaftBearingNumber':
          driveAssemblyHeadShaftBearingNumber,
      'driveAssemblyHeadShaftBearingType': driveAssemblyHeadShaftBearingType,
      'driveAssemblyHeadShaftBearingSize': driveAssemblyHeadShaftBearingSize,
      'driveAssemblyBearingCondition': driveAssemblyBearingCondition,
      'driveAssemblyHeadShaftDiameter': driveAssemblyHeadShaftDiameter,
      'driveAssemblyHeadShaftLength': driveAssemblyHeadShaftLength,
      'driveAssemblyKey': driveAssemblyKey,
      'driveAssemblyBushings': driveAssemblyBushings,
      'driveAssemblySetScrews': driveAssemblySetScrews,
      'driveAssemblyShaftCondition': driveAssemblyShaftCondition,
      'driveAssemblyHeadPulleyType': driveAssemblyHeadPulleyType,
      'driveAssemblyPulleySize': driveAssemblyPulleySize,
      'driveAssemblyPulleyCondition': driveAssemblyPulleyCondition,
      'driveAssemblyIsHeadPulleyCentered': driveAssemblyIsHeadPulleyCentered,
      'driveAssemblyIsHeadPulleyLevel': driveAssemblyIsHeadPulleyLevel,
      'driveAssemblyCouplerType': driveAssemblyCouplerType,
      'driveAssemblyCouplerCondition': driveAssemblyCouplerCondition,
      'driveAssemblyGearboxType': driveAssemblyGearboxType,
      'driveAssemblyGearboxCondition': driveAssemblyGearboxCondition,
      'driveAssemblyMotorType': driveAssemblyMotorType,
      'driveAssemblyMotorId': driveAssemblyMotorId,
      'driveAssemblyHp': driveAssemblyHp,
      'driveAssemblyVoltage': driveAssemblyVoltage,
      'driveAssemblyBrakeType': driveAssemblyBrakeType,
      'driveAssemblyBrakeId': driveAssemblyBrakeId,
      'driveAssemblyFtLbs': driveAssemblyFtLbs,
      'driveAssemblyIsDriveSkip': driveAssemblyIsDriveSkip,
      'driveAssemblySkipReason': driveAssemblySkipReason,
      'driveAssemblySafTStopBrake': driveAssemblySafTStopBrake,
      'driveAssemblySafTStopLinkage': driveAssemblySafTStopLinkage,
      'driveAssemblyOverallSafTStopCondition':
          driveAssemblyOverallSafTStopCondition,
      'driveAssemblyDriveSupportType': driveAssemblyDriveSupportType,
      'driveAssemblyDriveComments': driveAssemblyDriveComments,
      'driveAssemblyTopLandingSafetiesType1':
          driveAssemblyTopLandingSafetiesType1,
      'driveAssemblyTopLandingSafetiesType1Condition':
          driveAssemblyTopLandingSafetiesType1Condition,
      'driveAssemblyTopLandingSafetiesType2':
          driveAssemblyTopLandingSafetiesType2,
      'driveAssemblyTopLandingSafetiesType2Condition':
          driveAssemblyTopLandingSafetiesType2Condition,
      'driveAssemblyTopLandingSafetiesType3Condition':
          driveAssemblyTopLandingSafetiesType3Condition,
      'driveAssemblyTopLandingSafetiesType3':
          driveAssemblyTopLandingSafetiesType3,
      'driveAssemblyTopLandingSafetiesTopReset':
          driveAssemblyTopLandingSafetiesTopReset,
      'driveAssemblyTopLandingSafetiesTopResetLocation':
          driveAssemblyTopLandingSafetiesTopResetLocation,
      'driveAssemblyTopLandingSafetiesTopResetCompliant':
          driveAssemblyTopLandingSafetiesTopResetCompliant,
      'driveAssemblyTopLandingSafetiesTopResetCondition':
          driveAssemblyTopLandingSafetiesTopResetCondition,
      'driveAssemblyTopLandingSafetiesSafetyDeviceSwitches':
          driveAssemblyTopLandingSafetiesSafetyDeviceSwitches,
      'driveAssemblyTopLandingSafetiesHasAlertingSystem':
          driveAssemblyTopLandingSafetiesHasAlertingSystem,
      'driveAssemblyTopLandingSafetiesComments':
          driveAssemblyTopLandingSafetiesComments,
      'electricalNemaType': electricalNemaType,
      'electricalVoltage': electricalVoltage,
      'electricalHasControlPanel': electricalHasControlPanel,
      'electricalControlPanelLocation': electricalControlPanelLocation,
      'electricalIndividualControlLocation':
          electricalIndividualControlLocation,
      'electricalHasStarter': electricalHasStarter,
      'electricalHasControlRelay': electricalHasControlRelay,
      'electricalHasPhaseReversalRelay': electricalHasPhaseReversalRelay,
      'electricalHas3PoleContactor': electricalHas3PoleContactor,
      'loadTestTestResult': loadTestTestResult,
      'loadTestWeightUsed': loadTestWeightUsed,
      'loadTestStoppingDistance': loadTestStoppingDistance,
      'loadTestBeltManliftSpeed': loadTestBeltManliftSpeed,
    };
  }

  factory BeltInspection.fromMap(Map<String, dynamic> map) {
    return BeltInspection(
      tailSectionFootAssemblyLegCondition:
          map['tailSectionFootAssemblyLegCondition'],
      tailSectionFootAssemblyLegAnchors:
          map['tailSectionFootAssemblyLegAnchors'],
      tailSectionFootAssemblyLegAnchorsCondition:
          map['tailSectionFootAssemblyLegAnchorsCondition'],
      tailSectionFootAssemblyLegsAnchoredTo:
          map['tailSectionFootAssemblyLegsAnchoredTo'],
      tailSectionFootAssemblyBottomCircleType:
          map['tailSectionFootAssemblyBottomCircleType'],
      tailSectionFootAssemblyBottomCircleCondition:
          map['tailSectionFootAssemblyBottomCircleCondition'],
      tailSectionFootAssemblyBottomBearings:
          map['tailSectionFootAssemblyBottomBearings'],
      tailSectionFootAssemblyBottomBearingsCondition:
          map['tailSectionFootAssemblyBottomBearingsCondition'],
      tailSectionFootAssemblyBearingHousingCondition:
          map['tailSectionFootAssemblyBearingHousingCondition'],
      tailSectionFootAssemblyFootShaftDiameter:
          map['tailSectionFootAssemblyFootShaftDiameter'],
      tailSectionFootAssemblyFootShaftLength:
          map['tailSectionFootAssemblyFootShaftLength'],
      tailSectionFootAssemblyFootShaftCondition:
          map['tailSectionFootAssemblyFootShaftCondition'],
      tailSectionFootAssemblyDoesFootShaftHaveKey:
          map['tailSectionFootAssemblyDoesFootShaftHaveKey'],
      tailSectionFootAssemblyDoesFootShaftHaveBushing:
          map['tailSectionFootAssemblyDoesFootShaftHaveBushing'],
      tailSectionFootAssemblyDoesFootShaftHaveSetScrews:
          map['tailSectionFootAssemblyDoesFootShaftHaveSetScrews'],
      tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft: map[
          'tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft'],
      tailSectionFootAssemblyFootPulleyCondition:
          map['tailSectionFootAssemblyFootPulleyCondition'],
      tailSectionFootAssemblyTypeOfBeltAdjustment:
          map['tailSectionFootAssemblyTypeOfBeltAdjustment'],
      tailSectionFootAssemblyIsFootPulleyCentered:
          map['tailSectionFootAssemblyIsFootPulleyCentered'],
      tailSectionFootAssemblyBeltTracking:
          map['tailSectionFootAssemblyBeltTracking'],
      tailSectionFootAssemblyDebrisDeflector:
          map['tailSectionFootAssemblyDebrisDeflector'],
      tailSectionFootAssemblyDebrisDeflectorCondition:
          map['tailSectionFootAssemblyDebrisDeflectorCondition'],
      tailSectionFootAssemblyRopeSheaves:
          map['tailSectionFootAssemblyRopeSheaves'],
      tailSectionFootAssemblyRopeSheavesCondition:
          map['tailSectionFootAssemblyRopeSheavesCondition'],
      tailSectionFootAssemblyYokeAssembly:
          map['tailSectionFootAssemblyYokeAssembly'],
      tailSectionFootAssemblyComments: map['tailSectionFootAssemblyComments'],
      bottomLandingSafetiesType1: map['bottomLandingSafetiesType1'],
      bottomLandingSafetiesType1Condition:
          map['bottomLandingSafetiesType1Condition'],
      bottomLandingSafetiesType2: map['bottomLandingSafetiesType2'],
      bottomLandingSafetiesType2Location:
          map['bottomLandingSafetiesType2Location'],
      bottomLandingSafetiesType2Condition:
          map['bottomLandingSafetiesType2Condition'],
      bottomLandingSafetiesType3: map['bottomLandingSafetiesType3'],
      bottomLandingSafetiesType3Location:
          map['bottomLandingSafetiesType3Location'],
      bottomLandingSafetiesType3Condition:
          map['bottomLandingSafetiesType3Condition'],
      bottomLandingSafetiesBottomReset: map['bottomLandingSafetiesBottomReset'],
      bottomLandingSafetiesBottomResetLocation:
          map['bottomLandingSafetiesBottomResetLocation'],
      bottomLandingSafetiesBottomResetCompliant:
          map['bottomLandingSafetiesBottomResetCompliant'],
      bottomLandingSafetiesBottomResetCondition:
          map['bottomLandingSafetiesBottomResetCondition'],
      bottomLandingSafetiesVisualAudibleAlertingSystem:
          map['bottomLandingSafetiesVisualAudibleAlertingSystem'],
      bottomLandingSafetiesBottomSafetiesComments:
          map['bottomLandingSafetiesBottomSafetiesComments'],
      bottomLandingAuthorizedPersonnelOnlySign:
          map['bottomLandingAuthorizedPersonnelOnlySign'],
      bottomLandingInstructionSign: map['bottomLandingInstructionSign'],
      bottomLandingBottomFloorGetOffSign:
          map['bottomLandingBottomFloorGetOffSign'],
      bottomLandingBottomFloorGetOffSignLocation:
          map['bottomLandingBottomFloorGetOffSignLocation'],
      bottomLandingRedWarningLight: map['bottomLandingRedWarningLight'],
      bottomLandingLightLocation: map['bottomLandingLightLocation'],
      bottomLandingIsManliftInABelowGradePit:
          map['bottomLandingIsManliftInABelowGradePit'],
      bottomLandingManliftClean: map['bottomLandingManliftClean'],
      bottomLandingDoesManliftUseUpSidePlatform:
          map['bottomLandingDoesManliftUseUpSidePlatform'],
      bottomLandingDescribeOpening: map['bottomLandingDescribeOpening'],
      bottomLandingIsStepLevelAfterCompletingTurn:
          map['bottomLandingIsStepLevelAfterCompletingTurn'],
      bottomLandingDistanceFromFloorOpeningToGuardRailUpSide:
          map['bottomLandingDistanceFromFloorOpeningToGuardRailUpSide'],
      bottomLandingDoesManliftUseDownSidePlatform:
          map['bottomLandingDoesManliftUseDownSidePlatform'],
      bottomLandingDistanceFromFloorOpeningToGuardRailDownSide:
          map['bottomLandingDistanceFromFloorOpeningToGuardRailDownSide'],
      bottomLandingLadderRungs: map['bottomLandingLadderRungs'],
      bottomLandingDistanceBetweenRungs:
          map['bottomLandingDistanceBetweenRungs'],
      bottomLandingLadderRungsCondition:
          map['bottomLandingLadderRungsCondition'],
      bottomLandingMaze: map['bottomLandingMaze'],
      bottomLandingSelfClosingGates: map['bottomLandingSelfClosingGates'],
      bottomLandingAreGatesSelfClosing: map['bottomLandingAreGatesSelfClosing'],
      bottomLandingOpenOutward: map['bottomLandingOpenOutward'],
      bottomLandingAreGatesMissing: map['bottomLandingAreGatesMissing'],
      bottomLandingToeboard: map['bottomLandingToeboard'],
      bottomLandingAddToeboard: map['bottomLandingAddToeboard'],
      bottomLandingToeboardHeight: map['bottomLandingToeboardHeight'],
      bottomLandingDistanceFromFaceOfBeltToBackEdgeOfFloorOpening:
          map['bottomLandingDistanceFromFaceOfBeltToBackEdgeOfFloorOpening'],
      bottomLandingBottomLandingNotesComments:
          map['bottomLandingBottomLandingNotesComments'],
      bottomLandingHoodTypeOfHood: map['bottomLandingHoodTypeOfHood'],
      bottomLandingHoodHoodCondition: map['bottomLandingHoodHoodCondition'],
      bottomLandingHoodHoodClearance: map['bottomLandingHoodHoodClearance'],
      bottomLandingHoodIfStationaryDistanceFromFaceOfBelt:
          map['bottomLandingHoodIfStationaryDistanceFromFaceOfBelt'],
      bottomLandingHoodAngleOfSlope: map['bottomLandingHoodAngleOfSlope'],
      bottomLandingHoodShape: map['bottomLandingHoodShape'],
      bottomLandingHoodIfMoveableWhatTypeOfSwitch:
          map['bottomLandingHoodIfMoveableWhatTypeOfSwitch'],
      bottomLandingHoodLocationOfHinges:
          map['bottomLandingHoodLocationOfHinges'],
      bottomLandingHoodCounterweighted: map['bottomLandingHoodCounterweighted'],
      bottomLandingHoodDoesHoodHaveARolledEdge:
          map['bottomLandingHoodDoesHoodHaveARolledEdge'],
      bottomLandingHoodIfMoveableDoesTheSwitchWork:
          map['bottomLandingHoodIfMoveableDoesTheSwitchWork'],
      bottomLandingHoodConditionOfRolledEdge:
          map['bottomLandingHoodConditionOfRolledEdge'],
      bottomLandingHoodBottomHoodComments:
          map['bottomLandingHoodBottomHoodComments'],
      beltingBeltingType: map['beltingBeltingType'],
      beltingBeltingCondition: map['beltingBeltingCondition'],
      beltingWidth: map['beltingWidth'],
      beltingColor: map['beltingColor'],
      beltingSpliceType: map['beltingSpliceType'],
      beltingSpliceLength: map['beltingSpliceLength'],
      beltingNumberOfBolts: map['beltingNumberOfBolts'],
      beltingMissingBolts: map['beltingMissingBolts'],
      beltingMissingBoltsNumber: map['beltingMissingBoltsNumber'],
      beltingSpliceBoltCondition: map['beltingSpliceBoltCondition'],
      beltingInstructionsStenciledOnTheBelt:
          map['beltingInstructionsStenciledOnTheBelt'],
      beltingDirectionalArrowsStenciledOnTheBelt:
          map['beltingDirectionalArrowsStenciledOnTheBelt'],
      beltingCompressiveFlexFailure: map['beltingCompressiveFlexFailure'],
      beltingTensionOfBelt: map['beltingTensionOfBelt'],
      beltingBeltConditionComments: map['beltingBeltConditionComments'],
      handholdsHandholdType: map['handholdsHandholdType'],
      handholdsHandholdColor: map['handholdsHandholdColor'],
      handholdsNumberOfHandholds: map['handholdsNumberOfHandholds'],
      handholdsDepth: map['handholdsDepth'],
      handholdsDistanceFromBelt: map['handholdsDistanceFromBelt'],
      handholdsDistanceFromStep: map['handholdsDistanceFromStep'],
      handholdsPunchingPattern: map['handholdsPunchingPattern'],
      handholdsConditionOfBolts: map['handholdsConditionOfBolts'],
      handholdsHandholdComments: map['handholdsHandholdComments'],
      stepsStepDescription: map['stepsStepDescription'],
      stepsNumberOfSteps: map['stepsNumberOfSteps'],
      stepsStepsMissing: map['stepsStepsMissing'],
      stepsMissingStepsNumber: map['stepsMissingStepsNumber'],
      stepsTreadColor: map['stepsTreadColor'],
      stepsNumberOfStepBarBolts: map['stepsNumberOfStepBarBolts'],
      stepsConditionOfElevatorBolts: map['stepsConditionOfElevatorBolts'],
      stepsMissingBolts: map['stepsMissingBolts'],
      stepsMissingStepBolts: map['stepsMissingStepBolts'],
      stepsStepBarBoltHolePattern: map['stepsStepBarBoltHolePattern'],
      stepsStepBarToStepBarCenters: map['stepsStepBarToStepBarCenters'],
      stepsStepRollerType: map['stepsStepRollerType'],
      stepsStepRollerCondition: map['stepsStepRollerCondition'],
      stepsStepRollersBolts: map['stepsStepRollersBolts'],
      stepsStepTreadMaterial: map['stepsStepTreadMaterial'],
      stepsConditionOfStepTreads: map['stepsConditionOfStepTreads'],
      stepsAntiSkid: map['stepsAntiSkid'],
      stepsConditionOfAntiSkid: map['stepsConditionOfAntiSkid'],
      stepsStepPinsAndXyWasher: map['stepsStepPinsAndXyWasher'],
      stepsConditionOfStepPinsAndXyWasher:
          map['stepsConditionOfStepPinsAndXyWasher'],
      stepsStepBracketsCondition: map['stepsStepBracketsCondition'],
      stepsStepBarsCondition: map['stepsStepBarsCondition'],
      stepsStepComments: map['stepsStepComments'],
      intermediateLandingNumber: map['intermediateLandingNumber'],
      intermediateLandingAuthorizedPersonnelSign:
          map['intermediateLandingAuthorizedPersonnelSign'],
      intermediateLandingInstructionSign:
          map['intermediateLandingInstructionSign'],
      intermediateLandingFloorOpeningShape:
          map['intermediateLandingFloorOpeningShape'],
      intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideBack: map[
          'intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideBack'],
      intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideLeft: map[
          'intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideLeft'],
      intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight: map[
          'intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight'],
      intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideBack: map[
          'intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideBack'],
      intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideLeft: map[
          'intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideLeft'],
      intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideRight: map[
          'intermediateLandingDistanceFromFloorOpeningToGuardRailDownSideRight'],
      intermediateLandingMaze: map['intermediateLandingMaze'],
      intermediateLandingSelfClosingGates:
          map['intermediateLandingSelfClosingGates'],
      intermediateLandingAreGatesSelfClosing:
          map['intermediateLandingAreGatesSelfClosing'],
      intermediateLandingOpenOutward: map['intermediateLandingOpenOutward'],
      intermediateLandingAreGatesMissing:
          map['intermediateLandingAreGatesMissing'],
      intermediateLandingToeboard: map['intermediateLandingToeboard'],
      intermediateLandingAddlToeboard: map['intermediateLandingAddlToeboard'],
      intermediateLandingHoodCondition: map['intermediateLandingHoodCondition'],
      intermediateLandingHoodClearance: map['intermediateLandingHoodClearance'],
      intermediateLandingAngleOfSlope: map['intermediateLandingAngleOfSlope'],
      intermediateLandingDoesHoodHaveRolledEdge:
          map['intermediateLandingDoesHoodHaveRolledEdge'],
      intermediateLandingConditionOfRolledEdge:
          map['intermediateLandingConditionOfRolledEdge'],
      intermediateLandingLadderRungs: map['intermediateLandingLadderRungs'],
      intermediateLandingTensionOfBelt: map['intermediateLandingTensionOfBelt'],
      intermediateLandingConditionOfRopeGuides:
          map['intermediateLandingConditionOfRopeGuides'],
      intermediateLandingNeedAddlRopeGuides:
          map['intermediateLandingNeedAddlRopeGuides'],
      intermediateLandingLighting: map['intermediateLandingLighting'],
      intermediateLandingIsLandingClean:
          map['intermediateLandingIsLandingClean'],
      intermediateLandingLateralBracing:
          map['intermediateLandingLateralBracing'],
      intermediateLandingCheckAttachmentBolts:
          map['intermediateLandingCheckAttachmentBolts'],
      intermediateLandingAreAttachmentsInPlace:
          map['intermediateLandingAreAttachmentsInPlace'],
      topLandingNumber: map['topLandingNumber'],
      topLandingAuthorizedPersonnelSign:
          map['topLandingAuthorizedPersonnelSign'],
      topLandingInstructionSign: map['topLandingInstructionSign'],
      topLandingFloorOpeningShape: map['topLandingFloorOpeningShape'],
      topLandingDistanceFromFloorOpeningToGuardRailUpSideBack:
          map['topLandingDistanceFromFloorOpeningToGuardRailUpSideBack'],
      topLandingDistanceFromFloorOpeningToGuardRailUpSideLeft:
          map['topLandingDistanceFromFloorOpeningToGuardRailUpSideLeft'],
      topLandingDistanceFromFloorOpeningToGuardRailUpSideRight:
          map['topLandingDistanceFromFloorOpeningToGuardRailUpSideRight'],
      topLandingDistanceFromFloorOpeningToGuardRailDownSideBack:
          map['topLandingDistanceFromFloorOpeningToGuardRailDownSideBack'],
      topLandingDistanceFromFloorOpeningToGuardRailDownSideLeft:
          map['topLandingDistanceFromFloorOpeningToGuardRailDownSideLeft'],
      topLandingDistanceFromFloorOpeningToGuardRailDownSideRight:
          map['topLandingDistanceFromFloorOpeningToGuardRailDownSideRight'],
      topLandingMaze: map['topLandingMaze'],
      topLandingSelfClosingGates: map['topLandingSelfClosingGates'],
      topLandingAreGatesSelfClosing: map['topLandingAreGatesSelfClosing'],
      topLandingOpenOutward: map['topLandingOpenOutward'],
      topLandingAreGatesMissing: map['topLandingAreGatesMissing'],
      topLandingToeboard: map['topLandingToeboard'],
      topLandingAddlToeboard: map['topLandingAddlToeboard'],
      topLandingHoodCondition: map['topLandingHoodCondition'],
      topLandingHoodClearance: map['topLandingHoodClearance'],
      topLandingAngleOfSlope: map['topLandingAngleOfSlope'],
      topLandingDoesHoodHaveRolledEdge: map['topLandingDoesHoodHaveRolledEdge'],
      topLandingConditionOfRolledEdge: map['topLandingConditionOfRolledEdge'],
      topLandingLadderRungs: map['topLandingLadderRungs'],
      topLandingTensionOfBelt: map['topLandingTensionOfBelt'],
      topLandingConditionOfRopeGuides: map['topLandingConditionOfRopeGuides'],
      topLandingNeedAddlRopeGuides: map['topLandingNeedAddlRopeGuides'],
      topLandingLighting: map['topLandingLighting'],
      topLandingIsLandingClean: map['topLandingIsLandingClean'],
      topLandingLateralBracing: map['topLandingLateralBracing'],
      topLandingCheckAttachmentBolts: map['topLandingCheckAttachmentBolts'],
      topLandingAreAttachmentsInPlace: map['topLandingAreAttachmentsInPlace'],
      driveAssemblyHeadCircleType: map['driveAssemblyHeadCircleType'],
      driveAssemblyCircleCondition: map['driveAssemblyCircleCondition'],
      driveAssemblyBeltTracking: map['driveAssemblyBeltTracking'],
      driveAssemblyLaggingCondition: map['driveAssemblyLaggingCondition'],
      driveAssemblyFasteningMethod: map['driveAssemblyFasteningMethod'],
      driveAssemblyHeadShaftBearingNumber:
          map['driveAssemblyHeadShaftBearingNumber'],
      driveAssemblyHeadShaftBearingType:
          map['driveAssemblyHeadShaftBearingType'],
      driveAssemblyHeadShaftBearingSize:
          map['driveAssemblyHeadShaftBearingSize'],
      driveAssemblyBearingCondition: map['driveAssemblyBearingCondition'],
      driveAssemblyHeadShaftDiameter: map['driveAssemblyHeadShaftDiameter'],
      driveAssemblyHeadShaftLength: map['driveAssemblyHeadShaftLength'],
      driveAssemblyKey: map['driveAssemblyKey'],
      driveAssemblyBushings: map['driveAssemblyBushings'],
      driveAssemblySetScrews: map['driveAssemblySetScrews'],
      driveAssemblyShaftCondition: map['driveAssemblyShaftCondition'],
      driveAssemblyHeadPulleyType: map['driveAssemblyHeadPulleyType'],
      driveAssemblyPulleySize: map['driveAssemblyPulleySize'],
      driveAssemblyPulleyCondition: map['driveAssemblyPulleyCondition'],
      driveAssemblyIsHeadPulleyCentered:
          map['driveAssemblyIsHeadPulleyCentered'],
      driveAssemblyIsHeadPulleyLevel: map['driveAssemblyIsHeadPulleyLevel'],
      driveAssemblyCouplerType: map['driveAssemblyCouplerType'],
      driveAssemblyCouplerCondition: map['driveAssemblyCouplerCondition'],
      driveAssemblyGearboxType: map['driveAssemblyGearboxType'],
      driveAssemblyGearboxCondition: map['driveAssemblyGearboxCondition'],
      driveAssemblyMotorType: map['driveAssemblyMotorType'],
      driveAssemblyMotorId: map['driveAssemblyMotorId'],
      driveAssemblyHp: map['driveAssemblyHp'],
      driveAssemblyVoltage: map['driveAssemblyVoltage'],
      driveAssemblyBrakeType: map['driveAssemblyBrakeType'],
      driveAssemblyBrakeId: map['driveAssemblyBrakeId'],
      driveAssemblyFtLbs: map['driveAssemblyFtLbs'],
      driveAssemblyIsDriveSkip: map['driveAssemblyIsDriveSkip'],
      driveAssemblySkipReason: map['driveAssemblySkipReason'],
      driveAssemblySafTStopBrake: map['driveAssemblySafTStopBrake'],
      driveAssemblySafTStopLinkage: map['driveAssemblySafTStopLinkage'],
      driveAssemblyOverallSafTStopCondition:
          map['driveAssemblyOverallSafTStopCondition'],
      driveAssemblyDriveSupportType: map['driveAssemblyDriveSupportType'],
      driveAssemblyDriveComments: map['driveAssemblyDriveComments'],
      driveAssemblyTopLandingSafetiesType1:
          map['driveAssemblyTopLandingSafetiesType1'],
      driveAssemblyTopLandingSafetiesType1Condition:
          map['driveAssemblyTopLandingSafetiesType1Condition'],
      driveAssemblyTopLandingSafetiesType2:
          map['driveAssemblyTopLandingSafetiesType2'],
      driveAssemblyTopLandingSafetiesType2Condition:
          map['driveAssemblyTopLandingSafetiesType2Condition'],
      driveAssemblyTopLandingSafetiesType3Condition:
          map['driveAssemblyTopLandingSafetiesType3Condition'],
      driveAssemblyTopLandingSafetiesType3:
          map['driveAssemblyTopLandingSafetiesType3'],
      driveAssemblyTopLandingSafetiesTopReset:
          map['driveAssemblyTopLandingSafetiesTopReset'],
      driveAssemblyTopLandingSafetiesTopResetLocation:
          map['driveAssemblyTopLandingSafetiesTopResetLocation'],
      driveAssemblyTopLandingSafetiesTopResetCompliant:
          map['driveAssemblyTopLandingSafetiesTopResetCompliant'],
      driveAssemblyTopLandingSafetiesTopResetCondition:
          map['driveAssemblyTopLandingSafetiesTopResetCondition'],
      driveAssemblyTopLandingSafetiesSafetyDeviceSwitches:
          map['driveAssemblyTopLandingSafetiesSafetyDeviceSwitches'],
      driveAssemblyTopLandingSafetiesHasAlertingSystem:
          map['driveAssemblyTopLandingSafetiesHasAlertingSystem'],
      driveAssemblyTopLandingSafetiesComments:
          map['driveAssemblyTopLandingSafetiesComments'],
      electricalNemaType: map['electricalNemaType'],
      electricalVoltage: map['electricalVoltage'],
      electricalHasControlPanel: map['electricalHasControlPanel'],
      electricalControlPanelLocation: map['electricalControlPanelLocation'],
      electricalIndividualControlLocation:
          map['electricalIndividualControlLocation'],
      electricalHasStarter: map['electricalHasStarter'],
      electricalHasControlRelay: map['electricalHasControlRelay'],
      electricalHasPhaseReversalRelay: map['electricalHasPhaseReversalRelay'],
      electricalHas3PoleContactor: map['electricalHas3PoleContactor'],
      loadTestTestResult: map['loadTestTestResult'],
      loadTestWeightUsed: map['loadTestWeightUsed'],
      loadTestStoppingDistance: map['loadTestStoppingDistance'],
      loadTestBeltManliftSpeed: map['loadTestBeltManliftSpeed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BeltInspection.fromJson(String source) =>
      BeltInspection.fromMap(json.decode(source));
}
