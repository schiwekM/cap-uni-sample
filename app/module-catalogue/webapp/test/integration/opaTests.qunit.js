sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'tum/cap/sample/modulecatalogue/test/integration/FirstJourney',
		'tum/cap/sample/modulecatalogue/test/integration/pages/ModulesList',
		'tum/cap/sample/modulecatalogue/test/integration/pages/ModulesObjectPage'
    ],
    function(JourneyRunner, opaJourney, ModulesList, ModulesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('tum/cap/sample/modulecatalogue') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheModulesList: ModulesList,
					onTheModulesObjectPage: ModulesObjectPage
                }
            },
            opaJourney.run
        );
    }
);