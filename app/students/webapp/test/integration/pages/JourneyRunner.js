sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"students/test/integration/pages/StudentsList",
	"students/test/integration/pages/StudentsObjectPage"
], function (JourneyRunner, StudentsList, StudentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('students') + '/test/flpSandbox.html#students-tile',
        pages: {
			onTheStudentsList: StudentsList,
			onTheStudentsObjectPage: StudentsObjectPage
        },
        async: true
    });

    return runner;
});

