namespace com.sap.dsc.lgm.schema;

using {com.sap.dsc.lgm.common as common} from './common';
using {
  cuid,
  managed,
  Currency,
} from '@sap/cds/common';

entity FreightCosts : cuid, managed {
  hostDocumentType              : common.hostDocumentType;
  hostDocumentUUID              : UUID not null;
  grossAmountInDocumentCurrency : Decimal(28, 6);
  netAmountInDocumentCurrency   : Decimal(28, 6);
  documentCurrency              : Currency;
  to_freightCostItem            : Composition of many FreightCostItems
                                    on to_freightCostItem.freightCostParent = $self;
}

entity FreightCostItems : cuid, managed {
  chargeType                      : Association to ChargeType;
  freightCostParent               : Association to FreightCosts;
  chargeTypeDescription           : String(200);
  logisticalReference             : String(32);
  chargeCalculationLevel          : common.chargeCalculationLevel;
  finalAmountInRateCurrency       : Decimal(28, 6);
  rateAmountInRateCurrency        : Decimal(28, 6);
  rateCurrency                    : Currency;
  pricePerUnit                    : Decimal(28, 6);
  pricePerUnitUoM                 : common.UoM;
  logisticalQuantity              : Decimal(28, 6);
  logisticalQuantityUnitOfMeasure : common.UoM;
}

entity ChargeType : managed {
    key chargeType            : String(5);
        chargeTypeDescription : String(200);
        chargeCategory        : common.chargeCategory;
        chargeValueIndicator  : common.chargeValueIndicator;
        chargeSignIndicator   : common.chargeSignIndicator;
        chargeIsInactive      : Boolean;
}

annotate FreightCostItems with @(
UI.LineItem:
 
[
    
        {
            $Type : 'UI.DataField',
            Label : 'Charge Type',
            Value : chargeType_chargeType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : chargeTypeDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Logistical Reference',
            Value : logisticalReference,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Final Amount in Rate Currency',
            Value : finalAmountInRateCurrency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Rate Amount in Rate Currency',
            Value : rateAmountInRateCurrency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Rate Currency',
            Value : rateCurrency_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price Per Unit',
            Value : pricePerUnit,
        }
]
);
 
annotate FreightCosts with @(
   UI.FieldGroup #FreightCostFields : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : grossAmountInDocumentCurrency,
                Label : 'Gross Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : netAmountInDocumentCurrency,
                Label : 'Net Amount ',
            },
        ],
    }
);