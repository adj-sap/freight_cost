using com.sap.ngl as my from '../db/schema';

service CostService {
    @odata.draft.enabled
    entity FreightCosts as projection on my.FreightCosts;
    entity FreightCostItems as projection on my.FreightCostItems;
}