sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'tum/cap/sample/studiesmanagement/test/integration/FirstJourney',
		'tum/cap/sample/studiesmanagement/test/integration/pages/StudiesList',
		'tum/cap/sample/studiesmanagement/test/integration/pages/StudiesObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudiesList, StudiesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('tum/cap/sample/studiesmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudiesList: StudiesList,
					onTheStudiesObjectPage: StudiesObjectPage
                }
            },
            opaJourney.run
        );
    }
);