using StudiesManagement as service from '../../srv/studies-service';

annotate service.Studies with @(
    Common.SemanticKey : [initials],
    UI.PresentationVariant : {
        SortOrder : [
            {
                Property : initials,
            },
        ],
        Visualizations : [
            '@UI.LineItem',
        ],
    },
    UI.LineItem : [
        {
            Value : initials,
        },
        {
            Value : name,
        },
        {
            Value : creditsForCompletion,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#details',
            Label : '{i18n>STUDY_DETAILS}'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'modules/@UI.LineItem',
            Label : '{i18n>MODULES}'
        },
    ],
    UI.FieldGroup #details : {
        Data : [
            {
                Value : initials,
            },
            {
                Value : name,
            },
            {
                Value : creditsForCompletion,
            },
            {
                Value : semestersPerYear,
            },
            {
                Value : duration,
            },
        ]
    },
    UI.HeaderInfo : {
        TypeName : '{i18n>STUDY}',
        TypeNamePlural : '{i18n>STUDIES}',
        Title : {
            Value : name
        },
        Description : {
            Value : initials
        }
    },
);

annotate service.Modules with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>MODULE}',
        TypeNamePlural : '{i18n>MODULES}',
        Title : {
            Value : name
        }
    },
    UI.LineItem : [
        {
            Value : name,
        },
        {
            Value : credits,
        },
        {
            Value : isMandatory,
        },
    ]
);