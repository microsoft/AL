# 2023-05-31 Pattern - Use built-in data structures

AL comes with built-in data structures that have been optimized for performance and server resource consumption. Make sure that you're familiar with them to make your AL code as efficient as possible. 

When working with strings, make sure to use the `TextBuilder` data type and not repeated use of the `+=` operator on a `Text` variable. General guidance is to use a `Text` data type if you concatenate fewer than five strings (here the internal allocation of a `TextBuilder` and the final `ToText` invocation is more expensive). If you need to concatenate five strings or more or concatenate strings in a loop, then `TextBuilder` is faster. Also, use a `TextBuilder` data type instead of BigText when possible. For more information, see [TextBuilder Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/textbuilder/textbuilder-data-type?wt.mc_id=d365bc_inproduct_alextension). 

If you need a key-value data structure that is optimized for fast lookups, use a `Dictionary` data type. For more information, see [Dictionary Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/dictionary/dictionary-data-type?wt.mc_id=d365bc_inproduct_alextension). 

Use a `List` data type if you need an unbound "array" (where you would previously create a temporary table object). For more information, see [List Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/list/list-data-type?wt.mc_id=d365bc_inproduct_alextension). 

Use the `Media` or `MediaSet` data types instead of the `Blob` data type. The `Media` and `MediaSet` data types have a couple advantages over the `Blob` data type when working with images. First of all, a thumbnail version of the image is generated when you save the data. You can use the thumbnail when loading a page and then load the larger image asynchronously using a page background task. Second, data for `Media` and `MediaSet` data types is cached on the client. Data for the Blob data type is never cached on the server. It's always fetched from the database. 

For more information about performance tips and tricks for developers, see [Performance Articles For Developers](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/performance/performance-developer?wt.mc_id=d365bc_inproduct_alextension).


# 2023-05-25 Enable telemetry for your apps/extensions

To send telemetry data to Azure Application Insights, you must have an Application Insights resource in Azure. Once you have the Azure Application Insights resource, you can start to configure your apps/extensions to send telemetry data to it by setting the telemetry connection string in your app.json configuration file. See [Sending App/Extension Telemetry to Azure Application Insights](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-application-insights-for-extensions?wt.mc_id=d365bc_inproduct_alextension) for details.

On the overview page [Telemetry by area](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/administration/telemetry-available-telemetry#telemetry-by-area?wt.mc_id=d365bc_inproduct_alextension), you can see what type of data you can expect to get for your app/extension. Note that you get this data for all customers across the install base of the app/extension.

What does it cost to have telemetry enabled? It depends on how much data you ingest. Please review the article [Controlling Telemetry Cost](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/administration/telemetry-control-cost?wt.mc_id=d365bc_inproduct_alextension) to learn about cost of your telemetry and strategies for controlling it.

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
