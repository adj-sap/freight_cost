namespace com.sap.dsc.lgm.common;


using {sap.common.CodeList} from '@sap/cds/common';

entity hostDocumentTypes : CodeList {
    key code : String(4);
};

type hostDocumentType : Association to hostDocumentTypes;

entity ChargeCalculationLevels : CodeList{
    key code : String(2) enum {
        headerLevel   = '01';
        stageLevel    = '02';
    }
}

type chargeCalculationLevel : Association to ChargeCalculationLevels;

entity ChargeCategories : CodeList {
    key code : String(3) enum {
    basic     = '001';
    additional     = '002';
    }
}

type chargeCategory : Association to ChargeCategories;

entity ChargeSignIndicators : CodeList {
    key code: String(1) enum {
    Positive      = '+';
    Negative      = '-'
    }
};

type chargeSignIndicator : Association to ChargeSignIndicators;

entity ChargeValueIndicators   : CodeList{
    key code : String(1) enum {
    Absolute      = 'A';
    Percentage    = 'P'
    }
};

type chargeValueIndicator : Association to ChargeValueIndicators;

entity UnitOfMeasure : CodeList {
    key code  : String(3);
};

type UoM : Association to UnitOfMeasure;
