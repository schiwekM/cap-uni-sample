#import "template.typ": *

#show: workshop-setup

// Title Page
#align(center)[
  #v(2cm)
  
  #image("files/cap-logo.svg", width: 40%)
  
  #v(2cm)
  
  #text(size: 24pt, weight: "bold")[
    CAP Plugin Development Workshop
  ]
  
  #v(0.5cm)
  
  #text(size: 18pt)[
    Emoji Annotation Plugin
  ]
  
  #v(3cm)
  #align(left)[
  #text(size: 12pt)[
    *Date:* January 20, 2026
    
    *Contact:* _fill out_ 
    
    *Version:* 1.0
  ]]
]

#pagebreak()

// Table of Contents
#outline(
  title: "Table of Contents",
  indent: auto
)

#pagebreak()

// Content starts here
= CAP Plugin Development

== Objective

This exercise guides you through the development of a custom SAP Cloud Application Programming Model (CAP) plugin that adds emoji support via entity annotations. You will learn the fundamental concepts of CAP plugin architecture, lifecycle hooks, and extensibility mechanisms.

== Prerequisites

- Node.js 
- SAP CAP SDK (`@sap/cds-dk` installed globally)
- Basic understanding of JavaScript and CAP framework
- Familiarity with CDS modeling language
- Completed all of _#link-blue("https://pages.github.tools.sap/cap/docs/get-started/", "Getting Started")_ in Capire

== Task Overview

You will create a reusable CAP plugin that automatically processes emoji annotations in CDS models during runtime. This plugin demonstrates the basic structure of CAP Plugins, how to read the CDS model structure and dynamically register handlers from that.

#pagebreak()

= Step-by-Step Instructions

Development of CAP Plugins typically work in a way where the repository of the plugin includes a sample application that demonstrates how the plugin is used. In this sample, we use a _npm workspace_ setup to use the plugin. That same application is typically also used to test the functionality of the plugin via integration tests.

== Project Initialization

+ Create an empty directory for the plugin:
  ```bash
  mkdir emoji-plugin
  cd emoji-plugin
  ```

+ Initialize the Node.js project:
  ```bash
  npm init -y
  ```

+ Configure peer dependencies in `package.json`:
  ```json
  "peerDependencies": {
    "@sap/cds": ">=9"
  }
  ```

== Test Environment Setup

We will create a sample CAP application that can be used to develop, use and test the plugin.

+ Create a test directory structure:
  ```bash
  mkdir -p tests/bookshop
  cd tests/bookshop
  ```

+ Initialize a sample CAP project:
  ```bash
  cds init . --add sample
  ```

+ Remove all dependencies from `tests/bookshop/package.json` to ensure the plugin is tested in isolation.

+ Configure workspace in root `package.json`:
  ```json
  "workspaces": [
    "tests/bookshop"
  ]
  ```

+ Add the plugin as a dependency in `tests/bookshop/package.json`. It is important that the dependency here is the same as the name configured in the root level `package.json`:
  ```json
  "dependencies": {
    "emoji-plugin": "file:../.."
  }
  ```

== Plugin Foundation

+ Create `cds-plugin.js` in the project root with the following structure:
  ```javascript
  const cds = require("@sap/cds")
  
  console.log("1st - Plugin loaded")
  
  cds.once('served', () => {
    console.log("2nd - Services served")
  })
  ```
  
+ Do a root level `npm i`

+ `cd tests/bookshop`

+ `DEBUG=plugins cds watch`

+ Observe the log and understand when _1st_ and _2nd_ are triggered

In your output, you should now see that the emoji-plugin is loaded.

== CDS Model Structure Analysis

+ Examine the structure of CDS models in your test project

+ Add a custom emoji annotation to an entity in `tests/bookshop/db/schema.cds`:
  ```cds
  entity Books {
    title  : String @emoji;
  }
  ```

+ Understand that annotations follow a hierarchical structure in the CDS model

+ During runtime, access the CSN (Core Schema Notation) representation to inspect annotations

== Plugin Implementation

Implement the core functionality in `cds-plugin.js`. For that, we can loop through the CSN (Core Schema Notation, which is the representation of the CDS model during runtime) and search for the `@emoji` annotation. Implement the handler that adds an emoji to the element that is annotated.

```javascript
const cds = require("@sap/cds")

cds.once('served', (csn) => {
    for (const srv of cds.services) {
        if(srv.name === "db") continue
        for (const entity of srv.entities) {
            for (const element of entity.elements) {
                if (element["@emoji"]) {
                    // Process the emoji annotation
                }

            }
        }
    }
})
```

Make sure the appended emoji is added in your local application.

== cds add

Use the documentation to figure out how `cds add` works. When `cds add emoji` is executed, log something to the console.

== cds build 

Use the documentation to figure out how `cds build` works. When `cds build` is executed, log something to the console.

== Additional tasks

When there is still time left, come up with new ideas of what the plugin can do and implement that or continue to the next section with additional resources.

#pagebreak()
= Additional Resources

*Key Concepts of CAP:*
- #link-blue("https://pages.github.tools.sap/cap/docs/get-started/concepts", "Concepts")
- #link-blue("https://pages.github.tools.sap/cap/docs/get-started/features", "Features")

*Implementation samples and guides:*
- #link-blue("https://pages.github.tools.sap/cap/docs/guides/", "Playbook") - at least you should have seen everything there
- #link-blue("https://pages.github.tools.sap/cap/docs/node.js/cds-facade", "cds facade") - a good generic read to know what is available

*Videos on CAP Development:*
- #link-blue("https://community.sap.com/t5/devtoberfest/best-practices-in-cap/ec-p/14215088#M1099", "Best practices")
- #link-blue("https://community.sap.com/t5/devtoberfest/less-code-same-logic-reduce-your-custom-handlers-by-using-new-cap-features/ec-p/14214416#M1091", "Less code, same logic") - starts to hint to plugin development when the main goal is to reduce custom code

*Plugin specific documentation:*
- #link-blue("https://pages.github.tools.sap/cap/docs/node.js/cds-plugins", "Node.js Plugins")
- #link-blue("https://pages.github.tools.sap/cap/docs/java/building-plugins", "Java Plugins")
- #link-blue("https://pages.github.tools.sap/cap/docs/tools/apis/", "Design Time APIs") - `add` and `build` steps

*Generic resources:*
- #link-blue("https://pages.github.tools.sap/cap/docs/resources/", "CAP Resources Page")
