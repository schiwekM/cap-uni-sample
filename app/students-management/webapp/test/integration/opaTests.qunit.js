sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'tum/cap/sample/studentsmanagement/test/integration/FirstJourney',
		'tum/cap/sample/studentsmanagement/test/integration/pages/StudentsList',
		'tum/cap/sample/studentsmanagement/test/integration/pages/StudentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentsList, StudentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('tum/cap/sample/studentsmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentsList: StudentsList,
					onTheStudentsObjectPage: StudentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);