namespace com.sap.ngl;

using {cuid,managed,Currency,} from '@sap/cds/common';

entity FreightCosts: cuid,managed {
  hostDocument : String(10) not null;
  hostDocumentType : String(4) not null;
  @Semantics.amount.currencyCode: 'currency'
  @readonly grossAmount : Decimal(9,2) default 0.0;
  @Semantics.amount.currencyCode: 'currency'
  @readonly netAmount : Decimal(9,2) default 0.0;
  currency : Currency;
  _costItems : composition of many CostItems on _costItems.parent = $self;
}

entity CostItems: cuid,managed  {
  parent  : Association to one FreightCosts not null;
  itemNumber   : Int16;
  chargeType : String;
  chargeTypeDescription : String;
  chargeCalculationLevel : String;
  @Semantics.amount.currencyCode: 'currency'
  rate : Decimal(9,2);
  @Semantics.quantity.unitOfMeasure : 'unitOfMeasure'
  quantity : Decimal(9,2);
  @Semantics.amount.currencyCode: 'currency'
  finalAmount : Decimal(9,2);
  currency : Currency;
  unitOfMeasure : String(3);
}