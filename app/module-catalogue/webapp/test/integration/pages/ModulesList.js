sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'tum.cap.sample.modulecatalogue',
            componentId: 'ModulesList',
            contextPath: '/Modules'
        },
        CustomPageDefinitions
    );
});