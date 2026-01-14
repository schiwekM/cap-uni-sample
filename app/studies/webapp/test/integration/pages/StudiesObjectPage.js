sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'studies',
            componentId: 'StudiesObjectPage',
            contextPath: '/Studies'
        },
        CustomPageDefinitions
    );
});