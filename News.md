# 2023-05-09 AL debugger and snapshot capture doesn't work in Visual Studio Code v1.78

Update: Fix will be available in v1.78.2.

The Visual Studio Code v1.78 update contained a change that has impacted debugging for multiple different Visual Studio Code extensions, including AL.

The impact of this is that the debugger stops at the first breakpoint and then hangs.

On the AL side, the issue is tracked by [microsoft/AL/issues/7388](https://github.com/microsoft/AL/issues/7388).

Visual Studio Code is currently in the process of reverting the cause, tracked by [microsoft/vscode/issues/181485](https://github.com/microsoft/vscode/issues/181485). They expect that the change will be in the Insider build on Wednesday May 10th, and that there will be a fixed v1.78.2 by the end of the week.

In the meantime, the Visual Studio Code team recommends that you downgrade to [Visual Studio Code v1.77.3](https://code.visualstudio.com/updates/v1_77) and turn off automatic upgrades for Visual Studio Code, by adding "update.mode": "manual" (or none) to your settings.


# 2023-04-03 Welcome to the AL Home and AL Explorer 😃😃👏👏

You're reading this in one of the two new views added to the AL Language extension for Microsoft Dynamics 365 Business Central, namely AL Home and AL Explorer.

## AL Home
The AL Home shows news related to developing in AL for Business Central. It'll be used to share news, best practices, upcoming events, urgent information and status, and learn content.

## AL Explorer
The AL Explorer lets you easily browse your objects and the ones coming from apps in your dependencies. It's structured into four sections with the focus on extensibility points. These sections are: Objects, Events, Apis, Extensible Enums.

- Objects: Contains a collection of all the codeunits, tables, pages, pageextensions, reports, etc.
- Events: Contains the integration and business events made available to be subscribed to.
- Apis: Provides all the API pages.
- Extensible Enums: These are all the enums, which are extensible and that implement an interface.

## Filtering and grouping
In order to easier find what you are looking for, the AL Explorer provides search functionality to filter down the list based on the ID or Name. It also has Grouping options, which is fitted to match each section. The last option is to filter based on your bookmarked objects, the project in your workspace you want to target, or the app from your dependencies you want to explore.

![AL Explorer filtering and grouping](https://raw.githubusercontent.com/microsoft/AL/master/resources/ExplorerFilterAndGroup.gif)

## Advanced features
Some of you might recognize the look and feel of the AL Explorer's grid. It is built using the same component as analysis mode in the web client, which provides some capabilities that can be good to know.

- Sort using multiple columns by holding down shift you can click one column after the next one to set up the order of sorting done. 
- In the webclient it is possible to define a freeze pane, and the same functionality is possible here, by dragging a column to the top right or left, and holding it there for a moment. 
- Resizing columns can either be to the column on the left by default or to the one on the right, by holding down shift. 
- You can also reorder the columns to your liking by drag and dropping them.

![AL Explorer advanced features](https://raw.githubusercontent.com/microsoft/AL/master/resources/ExplorerAdvancedFeatures.gif)
