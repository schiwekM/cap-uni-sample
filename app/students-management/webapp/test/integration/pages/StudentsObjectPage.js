sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'tum.cap.sample.studentsmanagement',
            componentId: 'StudentsObjectPage',
            contextPath: '/Students'
        },
        CustomPageDefinitions
    );
});