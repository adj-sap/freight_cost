sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'freight/test/integration/FirstJourney',
		'freight/test/integration/pages/FreightCostsList',
		'freight/test/integration/pages/FreightCostsObjectPage',
		'freight/test/integration/pages/CostItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, FreightCostsList, FreightCostsObjectPage, CostItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('freight') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFreightCostsList: FreightCostsList,
					onTheFreightCostsObjectPage: FreightCostsObjectPage,
					onTheCostItemsObjectPage: CostItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);