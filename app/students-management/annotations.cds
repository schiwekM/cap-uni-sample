using StudentsManagement as service from '../../srv/students-service';

annotate service.Students with @(
    UI.LineItem : [
        {
            Value : userID,
        },
        {
            Value : firstName,
        },
        {
            Value : lastName,
        },
        {
            Value : study_ID,
        },
    ],
    UI.SelectionFields : [
        study_ID
    ],
    Common.SemanticKey: [userID],

    UI.HeaderInfo : {
        TypeName : '{i18n>STUDENT}',
        TypeNamePlural : '{i18n>STUDENTS}',
        Title : {
            Value : (displayName || '(' || userID || ')')
        },
        Description : {
            Value : study_ID
        }
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#details',
            Label : '{i18n>STUDENT_DETAILS}',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'modules/@UI.PresentationVariant',
        },
    ],
    UI.FieldGroup #details : {
        Data : [
            {
                Value : firstName,
            },
            {
                Value : lastName,
            },
            {
                Value : study_ID,
            },
        ]
    }
);

annotate service.ModuleAssignments with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>ASSIGNED_MODULE}',
        TypeNamePlural : '{i18n>ASSIGNED_MODULES}'
    },
    UI.PresentationVariant : {
        SortOrder : [
            {
                Property : module.name,
            },
        ],
        Visualizations : [
            '@UI.LineItem',
        ],
    },
    UI.LineItem : [
        {
            Value : module_ID,
        },
    ]
);
