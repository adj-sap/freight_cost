using com.sap.dsc.lgm.schema as my from '../db/schema';

namespace com.sap.dsc.lgm.service;

@protocol: 'none'
service CostDomainService {
    entity FreightCosts as projection on my.FreightCosts
    entity FreightCostItems as projection on my.FreightCostItems;
    entity ChargeType as projection on my.ChargeType;
}