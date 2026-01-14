sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/ModulesList",
	"project1/test/integration/pages/ModulesObjectPage",
	"project1/test/integration/pages/ModuleAssignmentsObjectPage"
], function (JourneyRunner, ModulesList, ModulesObjectPage, ModuleAssignmentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flpSandbox.html#project1-tile',
        pages: {
			onTheModulesList: ModulesList,
			onTheModulesObjectPage: ModulesObjectPage,
			onTheModuleAssignmentsObjectPage: ModuleAssignmentsObjectPage
        },
        async: true
    });

    return runner;
});

