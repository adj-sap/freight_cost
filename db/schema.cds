namespace com.sap.ngl;

using {com.sap.ngl.common as common} from './common';
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