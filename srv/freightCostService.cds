using com.sap.ngl as my from '../db/schema';

@path: '/cost'
service CostService {
    entity FreightCosts as projection on my.FreightCosts
    actions {
        action acceptCharges();
        action rejectCharges();
    };
    entity CostItems as projection on my.CostItems;
}