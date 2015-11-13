#!/usr/bin/perl

$NODATA = 'nodata';

%chemicalTests = (
    '01', 'BLOOD',
    '02', 'BREATH',
    '03', 'URINE',
    '04', 'REFUSED',
    );

%chemtestmod = (
    '01', 'FIELD SOBRIETY TEST',
    '02', 'OBSERVATION',
    '03', 'PBT',
    '97', 'OTHER',
    );

%collisionManners = (
    '01', 'Angle',
    '02', 'Backing',
    '03', 'Head on',
    '04', 'Opposing left turn',
    '05', 'Rear end',
    '06', 'Rear to rear',
    '07', 'Sideswipe-opposite direction',
    '08', 'Sideswipe-same direction',
    '09', 'Single vehicle',
    '80', 'Intersection-kars',
    '81', 'Overtaking-kars',
    '82', 'Right turn away from approaching vehicle',
    '83', 'Right turn into approaching vehicle-kars',
    '84', 'Sideswipe-kars'
);   

%collobj = (
    '01', 'ANIMAL',
    '02', 'BICYCLE',
    '03', 'DEER',
    '04', 'MOTOR VEHICLE IN TRANSPORT OTHER ROADWAY',
    '05', 'OTHER MOTOR VEHICLE',
    '06', 'PEDESTRIAN',
    '07', 'RAILROAD TRAIN',
    '08', 'OTHR OBJECT NOT FIXED',
    '09', 'BRIDGE PARAPET END',
    '10', 'BRIDGE PIER ABUTMENT',
    '11', 'BRIDGE RAIL',
    '12', 'BUILDING WALL',
    '13', 'CRASH CUSHION/IMPACT ATTENUATOR',
    '14', 'CULVERT/HEAD WALL',
    '15', 'CURBING',
    '16', 'EARTH EMBANKMENT/ROCKCUT/DITCH',
    '17', 'FENCE',
    '18', 'FIRE HYDRANT',
    '19', 'GUARDRAIL END',
    '20', 'GUARDRAIL FACE',
    '21', 'LIGHT/LUMINAIRE SUPPORT',
    '22', 'MAILBOX',
    '23', 'MEDIAN SUPPORT',
    '24', 'OTHER POST/POLE/SUPPORT',
    '25', 'OVERHEAD SIGN POST',
    '26', 'SIGN POST',
    '27', 'SNOW EMBANKMENT',
    '28', 'TOLL BOOTH',
    '29', 'TRAFFIC SIGNAL SUPPORT',
    '30', 'TREE',
    '31', 'UTILITY POLE',
    '32', 'OTHER FIXED OBJECT',
    '33', 'FELL FROM VEHICLE',
    '34', 'FIRE/EXPLOSION',
    '35', 'JACKKNIFE',
    '36', 'OVERTURNED',
    '37', 'RAN OFF ROADWAY (ONLY)',
    '38', 'SUBMERSION',
    '39', 'NON COLLISION: OTHER',
    '40', 'CABLE BARRIER ',
    '41', 'CONCRETE BARRIER ',
    '42', 'NON COLLISION: DOWNHILL RUNAWAY',
    '43', 'NON COLLISION: CARGO LOSS OR SHIFT',
    '44', 'NON COLLISION: SEPARATION OF UNITS',
    '45', 'NON COLLISION: EQUIPMENT FAILURE',
    '46', 'WORK ZONE MAINTENANCE EQUIPMENT',
    '47', 'OTHER MOVABLE OBJECT',
    '48', 'OTHER NON MOVABLE OBJECT',
   );

%environmentalFactors = (
    '01', 'ANIMALS ACTION',
    '02', 'CONSTRUCTION WORK ZONE',
    '03', 'DEBRIS IN ROADWAY',
    '04', 'FIXED OBJECT(S)',
    '05', 'GLARE',
    '06', 'HOLES/DEEP RUTS/BUMPS',
    '07', 'IMPROPERLY PARKED VEHICLE(S)',
    '08', 'IMPROPER/NON-WORKING TRAFFIC CONTROLS',
    '09', 'MAINTENANCE/UTILITY WORK ZONE',
    '10', 'SHOULDERS DEFECTIVE/DROP-OFF',
    '11', 'SLIPPERY SURFACE',
    '12', 'VIEW OBSTRUCTED/LIMITED',
    '13', 'WATER POOLING',
    '97', 'OTHER',
    '99', 'NONE DETECTED',
    );

%humanFactors = (
    '01', 'ALCOHOL INVOLVEMENT',
    '02', 'CELL PHONE',
    '03', 'DISREGARD TRAFFIC CONTROL',
    '04', 'DISTRACTION',
    '05', 'DRUG INVOLVEMENT',
    '06', 'EMOTIONAL',
    '07', 'EXCEEDED STATED SPEED LIMIT',
    '08', 'FAILED TO YIELD RIGHT OF WAY',
    '09', 'FATIGUE',
    '10', 'FELL ASLEEP',
    '11', 'FOLLOWING TOO CLOSE',
    '12', 'IMPROPER BACKING',
    '13', 'IMPROPER PASSING',
    '14', 'INATTENTION',
    '15', 'LOST CONSCIOUSNESS/FAINTED',
    '16', 'MEDICATION',
    '17', 'MISJUDGE CLEARANCE',
    '18', 'NOT UNDER PROPER CONTROL',
    '19', 'OVERCORRECTING/OVERSTEERING',
    '20', 'PHYSICAL DISABILITY',
    '21', 'SICK',
    '22', 'TOO FAST FOR CONDITIONS',
    '23', 'TURNING IMPROPERLY',
    '24', 'WEAVING IN TRAFFIC',
    '97', 'OTHER',
    '99', 'NONE DETECTED',
    );


%injuryLocation = (

    '01', 'HEAD/FACE',
    '02', 'NECK',
    '03', 'CHEST',
    '04', 'BACK',
    '05', 'ABDOMEN/PELVIS',
    '06', 'ARMS/HANDS',
    '07', 'LEGS/FEET',
    '08', 'MULTIPLE-ENTIRE BODY',
   );

%injurySeverity = (
    '01', 'FATAL',
    '02', 'INCAPACITATING',
    '03', 'NON-INCAPACITATING',
    '04', 'POSSIBLE INJURY',
    '05', 'NONE DETECTED',
    );

%landUse = (
    '01', 'Business',
    '02', 'Industrial',
    '03', 'Limited access',
    '04', 'Park',
    '05', 'Private property',
    '06', 'Residential',
    '07', 'Rural',
    '08', 'School'
);

%lightConditions = (
    '01', 'Dawn',
    '02', 'Daylight',
    '03', 'Dusk',
    '04', 'Dark-lighting off',
    '05', 'Dark-lighted',
    '06', 'Dark-not lighted',
    '07', 'Dark-unknown',
    '08', 'Other',
    '09', 'Unknown'
);

%locFirstEvent = (
    '01', 'GORE',
    '02', 'MEDIAN',
    '03', 'ON ROADWAY',
    '04', 'OUTSIDE SHOULDER-LEFT',
    '05', 'OUTSIDE SHOULDER-RIGHT',
    '06', 'SHOULDER',
    '80', 'OFF ROADWAY-KARS',
    '81', 'PUBLIC ACCESS LOT-KARS',
    '97', 'OTHER PROPERTY',
    );

%pedFactors = (
    '01', 'APPROACHING OR LEAVING VEHICLE',
    '02', 'AT INTERSECTION',
    '03', 'CROSSING AGAINST SIGNAL',
    '04', 'CROSSING WITH SIGNAL',
    '05', 'DARK CLOTHING/NOTVISIBLE',
    '06', 'DARTING INTO ROAD',
    '07', 'DRINKING',
    '08', 'DRUG RELATED',
    '09', 'GETTING ON/OFF VEHICLE',
    '10', 'IN CROSSWALK',
    '11', 'JOGGING',
    '12', 'LYING IN ROADWAY',
    '13', 'NOT AT INTERSECTION',
    '14', 'NOT IN ROADWAY',
    '15', 'PHYSICAL IMPAIRMENT',
    '16', 'PLAYING IN ROADWAY',
    '17', 'PUSHING VEHICLE',
    '18', 'SKATING/SKATEBOARDING',
    '19', 'WALKING IN ROADWAY',
    '20', 'WORKING IN ROADWAY',
    '21', 'WORKING ON VEHICLE',
    );

%personTypeCodes = (
    '01', 'DRIVER',
    '02', 'PASSENGER',
    '03', 'PEDESTRIAN',
    '04', 'ANIMAL-DRAWN/RIDDEN',
    '05', 'BICYCLIST',
    '06', 'TRAIN ENGINEER',
    '07', 'WITNESS',
    '08', 'OWNER ',
   );

%precollActions = (
    '01', 'Avoiding object in roadway',
    '02', 'Backing',
    '03', 'Changing lanes',
    '04', 'Entering parked position',
    '05', 'Going straight ahead',
    '06', 'Leaving traffic lane',
    '07', 'Making left turn',
    '08', 'Making right turn',
    '09', 'Making u turn',
    '10', 'Merging',
    '11', 'Overtaking',
    '12', 'Parked',
    '13', 'Slowing or stopped',
    '14', 'Starting from parking',
    '15', 'Starting in traffic',
    '16', 'Stopped in traffic',
    '17', 'Wrong way',
    '80', 'Other & unknown-kars',
    '97', 'Other',
    '98', 'Unknown'
);

%roadwayChar = (
    '01', 'Curve & grade',
    '02', 'Curve & hillcrest',
    '03', 'Curve & level',
    '04', 'Straight & grade',
    '05', 'Straight & hillcrest',
    '06', 'straight & level'
);

%roadwayTypes = (
    '01', 'COUNTY ROAD',
    '02', 'FEDERAL',
    '03', 'FRONTAGE ROAD',
    '04', 'INTERSTATE',
    '05', 'LOCAL STREET',
    '06', 'PARKWAY',
    '07', 'STATE',
    '99', 'NONE OF THE ABOVE',
    );

%testedFor = (
    '01', 'ALCOHOL',
    '02', 'DRUGS',
    '03', 'ALCOHOL & DRUGS',
    );

%trafficCtl = (
    '01', 'ADVISORY SPEED SIGN',
    '02', 'CENTER LINE',
    '03', 'CURVE SIGN',
    '04', 'FLASHING LIGHT',
    '05', 'MEDIAN',
    '06', 'NO PASSING ZONE',
    '07', 'OFFICER OR FLAGMAN',
    '08', 'RR GATES',
    '09', 'RR SIGNS OR SIGNALS',
    '10', 'SCHOOL ZONE SIGN',
    '11', 'STOP & GO SIGNAL',
    '12', 'STOP SIGN',
    '13', 'WARNING SIGNS',
    '14', 'YIELD SIGN',
    '97', 'OTHER',
    '99', 'NONE',
    );

%unittypes = (
    '01', 'BICYCLE',
    '02', 'BUS',
    '03', 'EMERGENCY VEHICLE-IN RESPONSE',
    '04', 'EMERGENCY VEHICLE-NON RESPONSE',
    '05', 'FARM TRACTOR &/OR FARM EQUIPMENT',
    '06', 'GOCART',
    '07', 'HIT & RUN/UNKNOWN',
    '08', 'LT TRUCK(VAN/SPORTS UTILITY/PICKUP)',
    '09', 'MILITARY VEHICLE',
    '10', 'MOTORCYCLE',
    '11', 'MOTOR HOME/RECREATIONAL VEHICLE',
    '12', 'MOTOR SCOOTER OR MOTOR BICYCLE',
    '13', 'OTHER PUBLIC OWNED VEHICLE',
    '14', 'PASSENGER CAR',
    '15', 'PASSENGER CAR & TRAILER',
    '16', 'PEDESTRIAN',
    '17', 'RAILROAD TRAIN',
    '18', 'RIDING ANIMAL/ANIMAL-DRAWN VEHICLE',
    '19', 'SCHOOL BUS',
    '20', 'TAXICAB',
    '21', 'TRUCK & TRAILER',
    '22', 'TRUCK-SINGLE UNIT',
    '23', 'TRUCK TRACTOR & SEMI-TRAILER',
    '24', 'TRUCK-OTHER COMBINATION',
    '80', 'TRUCK OR TRUCK-TRACTOR - KARS',
    '81', 'EMERGENCY VEHICLE - KARS',
    '97', 'OTHER',
);

%vehFactors = (
    '01', 'BRAKES DEFECTIVE',
    '02', 'HEADLIGHTS DEFECTIVE',
    '03', 'LOAD SECUREMENT',
    '04', 'OTHER LIGHTING DEFECTIVE',
    '05', 'OVERSIZED LOAD ON VEHICLE',
    '06', 'OVERWEIGHT',
    '07', 'STEERING FAILURE',
    '08', 'TIRE FAILURE',
    '09', 'TOW HITCH DEFECTIVE/UNIT SEPARATION',
    '97', 'OTHER',
    '99', 'NONE DETECTED ',
   );

%violationCodes = (
    'F', 'FELONY',
    'M', 'MISDEMEANOR',
    'O', 'OTHER',
    'V', 'VIOLATION',
    );

%weatherFactors = (
    '01', 'BLOWING SAND/SOIL/DIRT/SNOW',
    '02', 'CLEAR',
    '03', 'CLOUDY',
    '04', 'FOG/SMOG/SMOKE',
    '05', 'FOG WITH RAIN',
    '06', 'RAINING',
    '07', 'SEVERE CROSSWINDS',
    '08', 'SLEET/HAIL',
    '09', 'SNOWING',
    '97', 'OTHER',
    );

$prefix = "http://steveroggenkamp.com/kycrashdata";

$outfilePrefix = $ARGV[0];   # 
$nTriplesOut   = 0;          # number of triples generated
$nFileTriples  = 1000000;    # number of triples per output file
$fileNum       = 0;          # output file number

$outfilePrefix =~ s/\.[^.]*$//;
$outfileName   = sprintf("%s_%03d.ttl", $outfilePrefix, fileNum );

open( OUTFILE, ">$outfileName" ) || die "Could not open $outfileName";

# printf("output file pattern: %s\n", $outfileName );

# exit(0);
printf( "generating $outfileName " );

&outputPrefixes;

&outputCodes( "chemtests",     \%chemicalTests );
&outputCodes( "chemtestmod",   \%chemtestmod );
&outputCodes( "collman",       \%collisionManners );
&outputCodes( "collobj",       \%collobj );
&outputCodes( "envfactors",    \%environmentalFactors );
&outputCodes( "humfactors",    \%humanFactors );
&outputCodes( "injloc",        \%injuryLocation );
&outputCodes( "injsev",        \%injurySeverity );
&outputCodes( "landuse",       \%landUse );
&outputCodes( "lightcond",     \%lightConditions );
&outputCodes( "locfevt",       \%locFirstEvent );
&outputCodes( "pedfactors",    \%pedFactors );
&outputCodes( "persontype",    \%personTypeCodes );
&outputCodes( "precollaction", \%precollActions );
&outputCodes( "roadchar",      \%roadwayChar );
&outputCodes( "roadtype",      \%roadwayTypes );
&outputCodes( "testedfor",     \%testedFor );
&outputCodes( "unittype",      \%unittypes );
&outputCodes( "vehfactors",    \%vehFactors );
&outputCodes( "viocodes",      \%violationCodes );
&outputCodes( "wxfactors",     \%weatherFactors );

while (<>) {
    if ( $nTriplesOut > $nFileTriples ) {
	close( OUTFILE );
        printf( "%7d triples\n", $nTriplesOut );
	$fileNum++;
	$outfileName   = sprintf("%s_%03d.ttl", $outfilePrefix, $fileNum );
	open( OUTFILE, ">$outfileName" ) || die "Could not open $outfileName";
	printf( "generating $outfileName " );
	$nTriplesOut = 0;
	&outputPrefixes;
    }
    if ( m/^01/ ) {
	&collisionRecord( $_ );
    } elsif ( m/^02/ ) {
	&unitRecord( $_ );
    } elsif ( m/^03/ ) {
	&personRecord( $_ );
    } elsif ( m/^04/ ) {
	&roadTypeRecord( $_ );
    } elsif ( m/^08/ ) {
	&trafficControlRecord( $_ );
    } elsif ( m/^10/ ) {
	&pedestrianRecord( $_ );
    } elsif ( m/^11/ ) {
	&humanFactorRecord( $_ );
    } elsif ( m/^12/ ) {
	&vehicleFactorRecord( $_ );
    } elsif ( m/^13/ ) {
	&environmentalFactorRecord( $_ );
    } elsif ( m/^15/ ) {
	&violationRecord( $_ );
    } elsif ( m/^16/ ) {
	&citationRecord( $_ );
    } elsif ( m/^19/ ) {
	&chemTestMODRecord( $_ );
    } elsif ( m/^20/ ) {
	&chemTestRecord( $_ );
    }
#    s/^..(........).*$/$1/;
#    print
}

printf( "%7d triples\n", $nTriplesOut );

exit(0);

sub chemTestRecord {
    local($inrec) = @_;
    local($masterid)       = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($personNumber)   = &getfield($inrec,  12,   3 );
    local($chemTest)       = &getfield($inrec,  15,   2 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    local($personId) = $unitId . "P". $personNumber;
    if ( $chemTest != $NODATA ) {
	printf(OUTFILE "<:persons/$personId>\n" );
	outputLnkAttr( "a", "chemtest", "chemtests", $chemTest ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub chemTestMODRecord {
    local($inrec) = @_;
    local($masterid)       = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($personNumber)   = &getfield($inrec,  12,   3 );
    local($chemTestMOD)       = &getfield($inrec,  15,   2 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    local($personId) = $unitId . "P". $personNumber;
    if ( $chemTestMOD != $NODATA ) {
	printf( OUTFILE  "<:persons/$personId>\n" );
	outputLnkAttr( "a", "chemtestmod", "chemtestmod", $chemTestMOD ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub citationRecord {
    local($inrec) = @_;
    local($masterid)       = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($personNumber)   = &getfield($inrec,  12,   3 );
    local($citation)       = &getfield($inrec,  15,  10 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    local($personId) = $unitId . "P". $personNumber;
    if ( $citation != $NODATA ) {
	printf( OUTFILE  "<:persons/$personId>\n" );
	outputStrAttr( "a", "citation", $citation ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub collisionRecord {
    local($inrec) = @_;
    local($masterid)       = &getfield($inrec,   2,   8 );
    local($date)           = &getfield($inrec,  34,   8 );
    local($time)           = &getfield($inrec,  42,   4 );
    local($intersection)   = &getfield($inrec, 180,   1 );
    local($injuredNum)     = &getfield($inrec, 354,   3 );
    local($killedNum)      = &getfield($inrec, 357,   3 );
    local($unitsNum)       = &getfield($inrec, 360,   2 );
    local($unitsMotorNum)  = &getfield($inrec, 362,   2 );
    local($hitrun)         = &getfield($inrec, 364,   1 );
    local($oneway)         = &getfield($inrec, 365,   1 );
    local($speedLimit)     = &getfield($inrec, 366,   3 );
    local($countyCode)     = &getfield($inrec, 370,   3 );
    local($cityCountyCode) = &getfield($inrec, 370,   5 );
    local($inCity)         = &getfield($inrec, 383,   1 );
    local($lat)            = &getfield($inrec, 384,   8 );
    local($long)           = &getfield($inrec, 404,   9 );
    local($collisionManner)= &getfield($inrec, 556,   2 );
    local($firstEventCode) = &getfield($inrec, 558,   2 );
    local($totalLanes)     = &getfield($inrec, 560,   2 );
    local($roadwayChar)    = &getfield($inrec, 562,   2 );
    local($roadwaySurf)    = &getfield($inrec, 564,   2 );
    local($roadwayCond)    = &getfield($inrec, 566,   2 );
    local($weatherCond)    = &getfield($inrec, 568,   2 );
    local($lightCond)      = &getfield($inrec, 570,   2 );
    local($landUseCode)    = &getfield($inrec, 572,   2 );
    local($schoolBusCode)  = &getfield($inrec, 574,   2 );
    local($firstAid)       = &getfield($inrec, 576,   1 );

    printf( OUTFILE  "<:collision/$masterid>\n" );
    outputStrAttr( "a", "date", $date );
    outputStrAttr( "a", "time", $time );
    outputStrAttr( "a", "intersection", $intersection );
    outputNumAttr( "a", "numInjured", $injuredNum );
    outputNumAttr( "a", "numKilled", $killedNum );
    outputNumAttr( "a", "speedlimit", $speedLimit );
    outputStrAttr( "a", "hitrun", $hitrun );
    outputStrAttr( "a", "oneway", $oneway );
    outputLnkAttr( "a", "county", "counties", $countyCode );
#   outputStrAttr( "a", "city", $cityCountyCode );
    outputStrAttr( "a", "incity", $inCity );
    outputNumAttr( "a", "lat", $lat );
    outputNumAttr( "a", "long", $long );
    outputLnkAttr( "a", "collMan", "collman", $collisionManner );
    outputLnkAttr( "a", "firstEventCode", 'locfevt',$firstEventCode );
    outputNumAttr( "a", "totalLanes", $totalLanes );
    outputLnkAttr( "a", "roadwayChar", "roadchar", $roadwayChar );
    outputLnkAttr( "a", "roadwaySurf", "roadsurf", $roadwaySurf );
    outputLnkAttr( "a", "roadwayCond", "roadcond", $roadwayCond );
    outputLnkAttr( "a", "wxCond",      "wxfactors",$weatherCond );
    outputLnkAttr( "a", "lightCond",   "lightcond",$lightCond );
    outputLnkAttr( "a", "landUse",     "landuse",  $landUseCode );
    outputStrAttr( "a", "firstaid",   $firstAid );
#    outputStrAttr( "a", "firstaid", $firstAid );
    printf( OUTFILE  ".\n" );
}

sub environmentalFactorRecord {
   local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($envfactor) = &getfield($inrec,  15,   2 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    if ( $envfactor != $NODATA ) {
	printf( OUTFILE  "<:unit/$unitId>\n" );
	outputLnkAttr( "a", "envfactor", "envfactors",$envfactor ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub humanFactorRecord {
   local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($humfactor) = &getfield($inrec,  15,   2 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    if ( $humfactor != $NODATA ) {
	printf( OUTFILE  "<:unit/$unitId>\n" );
	outputLnkAttr( "a", "humfactor", "humfactors",$humfactor ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub pedestrianRecord {
    local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($pedfactor) = &getfield($inrec,  15,   2 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    if ( $pedfactor != $NODATA ) {
	printf( OUTFILE  "<:unit/$unitId>\n" );
	outputLnkAttr( "a", "pedfactor", "pedfactors",$pedfactor ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub personRecord {
    local($inrec) = @_;
    local($masterid)       = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($personNumber)   = &getfield($inrec,  12,   3 );
    local($personTypeCode) = &getfield($inrec,  15,   2 );
    local($personAge)      = &getfield($inrec,  82,   3 );
    local($gender)         = &getfield($inrec,  85,   1 );
    local($transported)    = &getfield($inrec, 164,   1 );
    local($injurySeverity) = &getfield($inrec, 165,   2 );
    local($injuryLocCode)  = &getfield($inrec, 167,   2 );
    local($restraintCode)  = &getfield($inrec, 171,   2 );
    local($chemSusp)       = &getfield($inrec, 179,   1 );
    local($chemTestCode)   = &getfield($inrec, 182,   2 );
    local($chemTestRes)    = &getfield($inrec, 209,  30 );
	
    local($unitId) = $masterid . "U" . $unitNumCode;
    local($personId) = $unitId . "P". $personNumber;

    if ( $personTypeCode != $NODATA ||
	 $personAge != $NODATA ||
	 $gender != $NODATA ||
	 $transported != $NODATA ||
	 $injurySeverity != $NODATA ||
	 $injuryLocCode != $NODATA ||
	 $restraintCode != $NODATA
	) {
	printf( OUTFILE  "<:unit/$unitId> <a:involvesPerson> <:persons/$personId>.\n" );
	printf( OUTFILE  "<:persons/$personId>\n" );
	outputLnkAttr( "a", "persontype", "persontype",$personTypeCode );
	outputNumAttr( "a", "personAge", $personAge );
	outputStrAttr( "a", "gender", $gender );
	outputStrAttr( "a", "transported", $transported );
	outputLnkAttr( "a", "injurySeverity", "injsev",$injurySeverity ); 
	outputLnkAttr( "a", "injuryLocation", "injloc",$injuryLocation ); 
	outputLnkAttr( "a", "restraintUse",   "restraints",$restraintCode );
	outputStrAttr( "a", "chemsupected", $chemSusp );
	outputLnkAttr( "a", "chemtest", "chemtest",$chemTestCode );
	outputStrAttr( "a", "chemtestres", $chemTestRes );
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub roadTypeRecord {
    local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($roadtype) = &getfield($inrec,  15,   2 );
    if ( $roadtype != $NODATA ) {
	printf( OUTFILE  "<:collision/$masterid>\n" );
	outputLnkAttr( "a", "roadtype", "roadtype",$roadtype ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub trafficControlRecord {
    local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($traffic)  = &getfield($inrec,  15,   2 );
    if ( $traffic != $NODATA ) {
	printf( OUTFILE  "<:collision/$masterid>\n" );
	outputLnkAttr( "a", "trafficctl", "trafficctl",$traffic ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub unitRecord {
    ($inrec) = @_;
    local($masterid)       = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($unitTypeCode)   = &getfield($inrec,  15,   2 );
    local($numOccupants)   = &getfield($inrec,  21,   3 );
    local($precollAction)  = &getfield($inrec,  24,   2 );
    local($fstEventCollCode) = &getfield($inrec,  28,   2 );
    local($sndEventCollCode) = &getfield($inrec,  30,   2 );

    $unitId = $masterid . "U" . $unitNumCode;
    printf( OUTFILE  "<:collision/$masterid> <a:involvedUnit> <:unit/$unitId>.\n" );
    printf( OUTFILE  "<:unit/$unitId>\n" );
    outputStrAttr( "a", "unitNum", $unitNumCode );
    outputLnkAttr( "a", "unitType", "unittype", $unitTypeCode );
    outputNumAttr( "a", "numOccupants", $numOccupants );
    outputLnkAttr( "a", "preCollAction", "precolacts", $precollAction );
    outputLnkAttr( "a", "firstCollisionWith", "collobj", $fstEventCollCode );
    outputLnkAttr( "a", "secondCollisionWith", "collobj", $sndEventCollCode );
    printf( OUTFILE  ".\n" );
    $nTriplesOut++;
}

sub vehicleFactorRecord {
   local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($vehfactor) = &getfield($inrec,  15,   2 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    if ( $vehfactor != $NODATA ) {
	printf( OUTFILE  "<:unit/$unitId>\n" );
	outputLnkAttr( "a", "vehfactor", "vehfactors",$vehfactor ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub violationRecord {
    local($inrec) = @_;
    local($masterid) = &getfield($inrec,   2,   8 );
    local($unitNumCode)    = &getfield($inrec,  10,   2 );
    local($personNumber)   = &getfield($inrec,  12,   3 );
    local($violationCode)  = &getfield($inrec,  15,   6 );
    local($unitId) = $masterid . "U" . $unitNumCode;
    local($personId) = $unitId . "P". $personNumber;
    if ( $vioCode != $NODATA ) {
	printf( OUTFILE  "<:persons/$personId>\n" );
	outputLnkAttr( "a", "violation", "viocode",$violationCode ); 
	printf( OUTFILE  ".\n" );
	$nTriplesOut++;
    }
}

sub getfield {
    ($str, $off, $len ) = @_;
    $val = substr( $str, $off, $len );
    if ( $val =~ m/^ +$/ ) {
	$val = $NODATA;
    }
    $val;
}

sub outputStrAttr {
    ($ns, $fld, $val ) = @_;
    if ( $val != $NODATA ) {
	printf( OUTFILE "  <$ns:$fld> \"$val\";\n" );
	$nTriplesOut++;
    }
}

sub outputNumAttr {
    ($ns, $fld, $val ) = @_;
    if ( $val != $NODATA ) {
	printf( OUTFILE "  <$ns:$fld> $val;\n" );
	$nTriplesOut++;
    }
}

sub outputLnkAttr {
    ($ns1, $fld, $ns2,$val ) = @_;
    if ( $val != $NODATA ) {
	$val =~ s/ *$//;
	printf( OUTFILE "  <$ns:$fld> <$ns2:$val>;\n" );
	$nTriplesOut++;
    }
}

sub outputCodes {
    ($path, $arr) = @_;
    foreach $key (sort keys($arr)) {
	printf( OUTFILE  "<$path:$key> <a:description> \"$$arr{$key}\".\n" );
	$nTriplesOut++;
    }
}

sub outputPrefixes {
    printf( OUTFILE  "\@prefix : <$prefix/> .\n" );
    printf( OUTFILE  "\@prefix a: <$prefix/attrs/> .\n");
    printf( OUTFILE  "\@prefix chemtests: <$prefix/chemtests/> .\n");
    printf( OUTFILE  "\@prefix chemtestmod: <$prefix/chemtestmod/> .\n");
    printf( OUTFILE  "\@prefix collman: <$prefix/collman/> .\n");
    printf( OUTFILE  "\@prefix collobj: <$prefix/collobj/> .\n");
    printf( OUTFILE  "\@prefix counties: <$prefix/counties/> .\n");
    printf( OUTFILE  "\@prefix envfactors: <$prefix/envfactors/> .\n");
    printf( OUTFILE  "\@prefix humfactors: <$prefix/humfactors/> .\n");
    printf( OUTFILE  "\@prefix injloc: <$prefix/injloc/> .\n");
    printf( OUTFILE  "\@prefix injsev: <$prefix/injsev/> .\n");
    printf( OUTFILE  "\@prefix lightcond: <$prefix/lightcond/> .\n");
    printf( OUTFILE  "\@prefix lnduse: <$prefix/lnduse/> .\n");
    printf( OUTFILE  "\@prefix locfevt: <$prefix/locfevt/> .\n");
    printf( OUTFILE  "\@prefix pedfactors: <$prefix/pedfactors/> .\n");
    printf( OUTFILE  "\@prefix persontype: <$prefix/persontype/> .\n");
    printf( OUTFILE  "\@prefix precollaction: <$prefix/precollaction/> .\n");
    printf( OUTFILE  "\@prefix roadchar: <$prefix/roadchar/> .\n");
    printf( OUTFILE  "\@prefix roadcond: <$prefix/roadcond/> .\n");
    printf( OUTFILE  "\@prefix roadsurf: <$prefix/roadsurf/> .\n");
    printf( OUTFILE  "\@prefix roadtype: <$prefix/roadtype/> .\n");
    printf( OUTFILE  "\@prefix testedfor: <$prefix/testedfor/> .\n");
    printf( OUTFILE  "\@prefix unittype: <$prefix/unittype/> .\n");
    printf( OUTFILE  "\@prefix vehfactors: <$prefix/vehfactors/> .\n");
    printf( OUTFILE  "\@prefix viocode: <$prefix/viocodes/> .\n");
    printf( OUTFILE  "\@prefix wxcond: <$prefix/wxcond/> .\n");
}
