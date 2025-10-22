using ModuleCatalogue as service from '../../srv/catalogue-service';

annotate service.Modules with @(
    UI.SelectionVariant #unassigned : {
        SelectOptions : [
            {
                PropertyName : isUserAssigned,
                Ranges : [
                    {
                        Sign : #I,
                        Option : #EQ,
                        Low : true,
                    },
                ],
            },
        ],
    },
    UI.PresentationVariant : {
        Text : '{i18n>MODULES}',
        SortOrder : [
            {
                Property : name,
            },
        ],
        Visualizations : [
            '@UI.LineItem',
        ],
    },
    UI.LineItem : [
        {
            Value : name,
        },
        {
            Value : credits,
        },
        {
            Value : additionalInfo,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ModuleCatalogue.assign',
            Label : '{i18n>ASSIGN}',
            Inline : true
        },
    ],
    UI.LineItem.@UI.Criticality : (isUserAssigned ? 3 : 0),
    UI.SelectionFields : [credits],
    Common.SemanticKey : [name],
    UI.HeaderInfo : {
        TypeName : '{i18n>MODULE}',
        TypeNamePlural : '{i18n>MODULES}',
        Title : {
            Value : name
        }
    }
);

annotate service.ModuleAssignments with @(
    UI.PresentationVariant : {
        Text : '{i18n>ASSIGNED_MODULES}',
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
            Value : module.name,
        },
        {
            Value : module.credits,
        },
        {
            Value : module.additionalInfo,
        },
        {
            Value : assignedAt,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ModuleCatalogue.unassign',
            Label : '{i18n>UNASSIGN}',
            Inline : true
        },
    ],
    Common.SemanticKey : [module_ID],
    UI.HeaderInfo : {
        TypeName : '{i18n>ASSIGNED_MODULE}',
        TypeNamePlural : '{i18n>ASSIGNED_MODULES}',
        Title : {
            Value : name
        }
    }
);