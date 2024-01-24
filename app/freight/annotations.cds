using CostService as service from '../../srv/freightCostService';

annotate service.FreightCosts with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>HostDocument}',
            Value : hostDocument,
        },
        {
            $Type : 'UI.DataField',
            Label : 'hostDocumentType',
            Value : hostDocumentType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'grossAmount',
            Value : grossAmount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'netAmount',
            Value : netAmount,
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
    ]
);
annotate service.FreightCosts with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'grossAmount',
                Value : grossAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'netAmount',
                Value : netAmount,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
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
            Label : 'Items',
            ID : 'Items',
            Target : '_costItems/@UI.LineItem#Items',
        },
    ]
);
annotate service.CostItems with @(
    UI.LineItem #Items : [
        {
            $Type : 'UI.DataField',
            Value : chargeCalculationLevel,
            Label : 'chargeCalculationLevel',
        },{
            $Type : 'UI.DataField',
            Value : chargeType,
            Label : 'chargeType',
        },{
            $Type : 'UI.DataField',
            Value : chargeTypeDescription,
            Label : 'chargeTypeDescription',
        },{
            $Type : 'UI.DataField',
            Value : currency_code,
        },{
            $Type : 'UI.DataField',
            Value : finalAmount,
            Label : 'finalAmount',
        },{
            $Type : 'UI.DataField',
            Value : itemNumber,
            Label : 'itemNumber',
        },{
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },{
            $Type : 'UI.DataField',
            Value : rate,
            Label : 'rate',
        },{
            $Type : 'UI.DataField',
            Value : unitOfMeasure,
            Label : 'unitOfMeasure',
        },]
);
annotate service.FreightCosts with @(
    UI.SelectionFields : [
        currency_code,
    ]
);

annotate service.FreightCosts with @(
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : hostDocument,
                    Descending : false,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    }
);
annotate service.FreightCosts with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : hostDocument,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : hostDocumentType,
        },
        ImageUrl : currency.symbol,
    }
);
