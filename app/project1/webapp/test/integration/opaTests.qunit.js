sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/FreightCostsList',
		'project1/test/integration/pages/FreightCostsObjectPage',
		'project1/test/integration/pages/FreightCostItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, FreightCostsList, FreightCostsObjectPage, FreightCostItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFreightCostsList: FreightCostsList,
					onTheFreightCostsObjectPage: FreightCostsObjectPage,
					onTheFreightCostItemsObjectPage: FreightCostItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);