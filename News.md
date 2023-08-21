# 2023-08-21 Enhancements to the HttpClient datatype documentation

Over the last months, we've worked on improving the developer documentation for how to use the HttpClient datatype to do outgoing web service calls from AL in Dynamics 365 Business Central.

First of all, we made the topic a first class citizen in the developer docs, by adding a new section in the table of contents (TOC) under **AL Platform** plus a new overview article, where we did the following:

- Explain high-level details on how to set up an external call (including how to use request and content headers), run it, and parse the result from the service. All three sections come with sample AL code that also tries to showcase how to write AL code, which is resilient towards failures.
- Document the supported HTTP methods (and this information is reused in relevant other pages).
- Explain HTTP status codes and include a troubleshooting guide on common HTTP status codes for client errors (4xx).
- Show how you can use certificates in your requests.
- Explain how to troubleshoot outgoing web service calls with telemetry.
- Give guidance on performance impact for UI sessions of outgoing calls.

For more information, read more in [Call external services with the HttpClient data type](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-httpclient).

Second, we updated the existing overview article for the HttpClient datatype with a new section on how HttpClient calls can fail and why it's important to react to return values of the methods HttpClient.Delete, HttpClient.Get, HttpClient.Post, HttpClient.Put, or HttpClient.Send. We also highlight how the gotcha AllowHttpClientRequests works in online sandboxes. Read more [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-data-type#ways-that-httpclient-calls-can-fail).


Third, the existing article on the HttpContent datatype got a new section on content headers, including the gotcha that we always have a default content header for `Content-Type`, namely `text/plain; charset=utf-8`. Read more on the [HttpContent datatype](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpcontent/httpcontent-data-type#content-headers).

Fourth, each of the existing articles on the methods HttpClient.Delete, HttpClient.Get, HttpClient.Post, HttpClient.Put, and HttpClient.Send methods got two new sections:

- Ways that HttpClient.XXX calls can fail
- Example sample AL code

The only two exceptions are the articles for HttpClient.Send and for HttpClient.Post:

- For HttpClient.Send, the generic examples shows how to do HTTP `PATCH` requests as this HTTP method currently doesn't yet have its own wrapper method. For more information on Httpclient.Send, see [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-send-method#example-http-patch).
- For HttpClient.Post, we threw in examples on how to use multipart/form-data in two examples on how to upload/stream files (either text or binary files). For more information on Httpclient.Post, see [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-post-method#example-how-to-upload-a-file-using-multipartform-data).


That's all for now, folks!

Most of these suggestions we added because you gave us feedback on things you would like to see in this part of docs. Keep the feedback coming, together we can make docs a really useful tool for AL developers.

# 2023-08-18 Introducing ALDoc: a new command line tool for generating reference documentation for AL extensions 
It’s our pleasure to announce that with the latest **Pre-Release** update of the AL Language extension for Microsoft Dynamics 365 Business Central, we have included the ALDoc tool for partners. The ALDoc tool generates documentation from symbolic and syntactical information, code comments, and overall application structure based on input .app file(s). Use it to generate internally or externally facing reference documentation for your solution. The tool also generates a help site with the reference articles, sorted by the application structure, based on the provided template. 

![Generated documentation](https://raw.githubusercontent.com/microsoft/AL/master/resources/aldoc.gif)

Read more about the tool in our docs [Generating help with the ALDoc tool](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/help/help-aldoc-generate-help?wt.mc_id=d365bc_inproduct_alextension)

We’d love to hear what you think, use [https://github.com/microsoft/AL/issues](https://github.com/microsoft/AL/issues) for tool feedback.

# 2023-08-16 Get the AL Language extension in pre-release versions on Visual Studio Code Marketplace

The AL Language extension Pre-Release versions are now available through the existing Visual Studio Code mechanism for getting notified about and installing Pre-Release versions. To learn more about this mechanism, visit [Prerelease Extensions](https://code.visualstudio.com/updates/v1_63#_pre-release-extensions) in the Visual Studio Code documentation.

To install the Pre-Release Version, use the drop-down to select **Install Pre-Release Version**, or if already installed, use the **Switch to Pre-Release Version** option in the Visual Studio Code extension management page for the AL Language extension.

![Switch to Pre-Release Version](https://raw.githubusercontent.com/microsoft/AL/master/resources/al_release.png)

When you have switched to the Pre-Release version, the Visual Studio Code extension management page for the AL Language extension will display that the Pre-Release is used, and offer the option to switch back to the Release Version.

![Switch to Release Version](https://raw.githubusercontent.com/microsoft/AL/master/resources/al_prerelease.png)

# 2023-06-21 Get started with developing generative AI features for Business Central

Let's bootstrap your AI journey with Azure OpenAI! We've shared some sample code as an extension that enables you to explore the possibilities of large-scale language models (LLM). This code is designed to simplify the process of setting up and running LLM experiments, starting with easily configuring and testing your connection to the Azure OpenAI service. After that, you can extend your AL logic to do more exciting things with this code.
The sample code uses Azure OpenAI to suggest an item category based on the item description field.

![Sample code using Azure OpenAI to make suggestions](https://raw.githubusercontent.com/microsoft/AL/master/resources/AI_code.png)

The extension's source code is available at the Business Central BCTech repository on GitHub. You can get to it directly at [https://aka.ms/BCStartCodingWithAI](https://aka.ms/BCStartCodingWithAI). You can either download or install the sample extension to your sandbox environment or clone the source code for your own projects.  

The product team is eager to hear your feedback on how we can support your use cases and help you design, build, and deliver AI solutions quickly and responsibly in the AI era: community partners are invited to join us at the [Copilot and AI Innovation group](https://go.microsoft.com/fwlink/?linkid=2229283) on our Yammer development network. 

Happy experimentation!

The Business Central product team

# 2023-05-31 Performance pattern - Use built-in data structures

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
