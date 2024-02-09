using CostService as service from '../../srv/freightCostService';
using from '../../db/common';

annotate service.FreightCosts with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'hostDocumentType_code',
            Value : hostDocumentType_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'grossAmountInDocumentCurrency',
            Value : grossAmountInDocumentCurrency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'netAmountInDocumentCurrency',
            Value : netAmountInDocumentCurrency,
        },
        {
            $Type : 'UI.DataField',
            Value : documentCurrency_code,
        },
    ]
);
annotate service.FreightCosts with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'hostDocumentType_code',
                Value : hostDocumentType_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'grossAmountInDocumentCurrency',
                Value : grossAmountInDocumentCurrency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'netAmountInDocumentCurrency',
                Value : netAmountInDocumentCurrency,
            },
            {
                $Type : 'UI.DataField',
                Value : documentCurrency_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item',
            ID : 'Item',
            Target : 'to_freightCostItem/@UI.LineItem#Item',
        },
    ]
);
annotate service.FreightCostItems with @(
    UI.LineItem #Item : [
        {
            $Type : 'UI.DataField',
            Value : chargeCalculationLevel_code,
            Label : 'chargeCalculationLevel_code',
        },{
            $Type : 'UI.DataField',
            Value : chargeType_chargeType,
            Label : 'chargeType_chargeType',
        },{
            $Type : 'UI.DataField',
            Value : chargeTypeDescription,
            Label : 'chargeTypeDescription',
        },{
            $Type : 'UI.DataField',
            Value : finalAmountInRateCurrency,
            Label : 'finalAmountInRateCurrency',
        },{
            $Type : 'UI.DataField',
            Value : freightCostParent_ID,
            Label : 'freightCostParent_ID',
        },{
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },{
            $Type : 'UI.DataField',
            Value : logisticalQuantity,
            Label : 'logisticalQuantity',
        },{
            $Type : 'UI.DataField',
            Value : logisticalQuantityUnitOfMeasure_code,
            Label : 'logisticalQuantityUnitOfMeasure_code',
        },{
            $Type : 'UI.DataField',
            Value : logisticalReference,
            Label : 'logisticalReference',
        },{
            $Type : 'UI.DataField',
            Value : pricePerUnit,
            Label : 'pricePerUnit',
        },{
            $Type : 'UI.DataField',
            Value : pricePerUnitUoM_code,
            Label : 'pricePerUnitUoM_code',
        },{
            $Type : 'UI.DataField',
            Value : rateAmountInRateCurrency,
            Label : 'rateAmountInRateCurrency',
        },{
            $Type : 'UI.DataField',
            Value : rateCurrency_code,
        },]
);
annotate service.FreightCostItems with {
    chargeCalculationLevel @Common.ValueListWithFixedValues : true
};
annotate service.ChargeCalculationLevels with {
    code @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextFirst,
    }
};
