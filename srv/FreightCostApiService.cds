using {
  com.sap.dsc.lgm.service.CostDomainService as CDS,
} from './FreightCostDomainService';

@path: '/api/v1/cost'
@protocol: 'odata-v4'
service CostApiService {
    entity FreightCosts as projection on CDS.FreightCosts
    entity FreightCostItems as projection on CDS.FreightCostItems;
    entity ChargeType as projection on CDS.ChargeType;
}