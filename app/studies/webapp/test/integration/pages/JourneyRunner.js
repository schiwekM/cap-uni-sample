sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"studies/test/integration/pages/StudiesList",
	"studies/test/integration/pages/StudiesObjectPage",
	"studies/test/integration/pages/ModulesObjectPage"
], function (JourneyRunner, StudiesList, StudiesObjectPage, ModulesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('studies') + '/test/flpSandbox.html#studies-tile',
        pages: {
			onTheStudiesList: StudiesList,
			onTheStudiesObjectPage: StudiesObjectPage,
			onTheModulesObjectPage: ModulesObjectPage
        },
        async: true
    });

    return runner;
});

