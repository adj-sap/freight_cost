using {
  com.sap.dsc.lgm.service.CostDomainService as CDS,
} from './FreightCostDomainService';

@path: '/ui/v1/cost'
@protocol: 'odata-v2'
service CostUiService {
  @odata.draft.enabled
    entity FreightCosts as projection on CDS.FreightCosts
    entity FreightCostItems as projection on CDS.FreightCostItems;
    entity ChargeType as projection on CDS.ChargeType;
}