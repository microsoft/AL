# 2025-02-26 Upcoming changes to the process of how we set up app key vaults for AppSource Apps

We're updating the [process](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/setup-app-key-vault) for registering partner tenants to use the key vault feature in their AppSource apps and moving to a fully automated process in the coming month. For this change to work properly we need to make sure that no partners have specified unused `keyVaultUrls` properties in their `app.json` files. The following concequences should be considered starting **1st of April 2025**:

1. Every AppSource submission with non valid entries in the `keyVaultUrls` property in the `app.json` file, will automatically be picked up for registration. If you don't want to register your key vault, please remove it from your `app.json` file before submitting. Any non valid or forgotten key vault URL will result in a submission failure. For more details follow the guidelines provided in the failure message in Partner Center.
2. Every AppSource submission that contains apps that already have an Entra Tenant ID registered will not fail even if they don't have a `AllowedBusinessCentralAppIds` special secret in their key vault URL. However, we highly recommend adding the secret by following the description in the [guide](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/administration/setup-app-key-vault) to avoid submissions failing in the future.
3. All Azure KeyVault URLs that are valid will result in registering the tenant ID that these key vaults belong to.

Note, that currently the deprecation scenario isn't supported and once the tenant ID is registered to an app, it can't be changed without reaching out to support in Partner Center.

# 2024-10-23 Business Central 2024 release wave 2 launch event content for developers

The Business Central 2024 release wave 2 went live on October 1st and with it the launch event was kicked off with videos on the latest innovations for Business Central. These videos contain high-quality content presented by product leaders to enable you to learn how to take Business Central to the next level as a developer. Visit the [Business Central Youtube channel](https://www.youtube.com/@MicrosoftDynamics365BC) to see what is available. We've produced a lot of content, and we guarantee you that it will be worth the time you invest in it.

If you're a developer, we'd suggest the following titles to get you started on the latest additions and improvements:

[What's new in AL - Language](https://www.youtube.com/watch?v=lofGuQRe1BM)  
[What's new in AL - Interfaces](https://www.youtube.com/watch?v=PHmFqehrPG4)  
[What's new in AL - Dependency Publishing](https://www.youtube.com/watch?v=JKsLjwSh0SQ)  
[What's new in AL: Easy access to source code with Open In VS Code and GitHub projects](https://www.youtube.com/watch?v=8t3WaWh7K9Y)  
[What's new: Analyze performance issues with scheduled profiles](https://www.youtube.com/watch?v=0qt0Zy9ZsRo)  
[What’s new: Data search improvements (for developers)](https://www.youtube.com/watch?v=lH2Z4xfdhmY)  
[Embedding resources in applications](https://www.youtube.com/watch?v=QhHgkCe3kkk)  
[What’s new: Reporting features (for developers and consultants)](https://www.youtube.com/watch?v=hn92Al_x-s8)  
[What’s new: Enhanced document reporting features (for developers)](https://www.youtube.com/watch?v=V8CSor5qBRE)  
[What's new: Business Central integration with Power Platform including Power BI (for developers)](https://www.youtube.com/watch?v=6Zb7VAvLVm4&list=PL1FESh9FqyhRj4fjUlWvghJ3rPFyz2Foz&index=40&t=551s)  
[What's new in AL-Go for GitHub](https://www.youtube.com/watch?v=weDf53bJOL4)  
[What's new: Run page scripts in CICD pipelines](https://www.youtube.com/watch?v=5GoAzII20L0)  
[What's new in the Co-Development initiative](https://www.youtube.com/watch?v=6SyNNeHQDUo)  

Learn about the latest usability and productivity improvements in the Business Central web client:

[What's new: Business Central user experience](https://www.youtube.com/watch?v=rWZcmEwwVHg)  

If you're interested in AI and Copilot, consider diving more into the topic with these sessions:

[What's new: Extending Copilot in Business Central](https://www.youtube.com/watch?v=QCo-uIfPs9g)  
[What's new: Setting up Copilot in Business Central - tips for admins](https://www.youtube.com/watch?v=UQmuMPRlHek)  
[What's new: Testing Copilot in Business Central](https://www.youtube.com/watch?v=eA7CENx7se0)  

For content about environment management, we suggest you watch the following videos:

[What's new: Auditing In Purview](https://www.youtube.com/watch?v=lk1YJKOmHyI)  
[What's new: Customer-managed encryption key & Lockbox](https://www.youtube.com/watch?v=DnZJ2iOgIjI)  
[What's new: Environment-level access controls for delegated administrators](https://www.youtube.com/watch?v=TBBlYpwbAFk)  
[What's new: Flexible update management](https://www.youtube.com/watch?v=uv2NsSD5P7U&list=PL1FESh9FqyhRj4fjUlWvghJ3rPFyz2Foz)  

Watch content about new integration functionality in these videos:

[What's new: Business Central integration with Power Platform including Power BI](https://www.youtube.com/watch?v=6Zb7VAvLVm4)  
[What's new: Auto-applying templates in integration with Dataverse](https://www.youtube.com/watch?v=ItuCEHpaI1E)  
[What's new: Power BI reporting for Business central - new apps](https://www.youtube.com/watch?v=DpYJOkwKxTY)  

With Copilot in Business Central, we've worked hard to provide productivity tools that help users be more effective in their work. The following videos dive into how Copilot can help get work done in Business Central:

[Introducing: Copilot for Finance: Why is this a game changer](https://www.youtube.com/watch?v=YL50nOTAPIY)  
[What's new: Suggest Number Series with Copilot](https://www.youtube.com/watch?v=MpDKjl7zzdk)  
[What's new: Analysis assist with Copilot in 2024 release wave 2](https://www.youtube.com/watch?v=GbMjcJurkFE)  
[What's new: Item Substitution with Copilot](https://www.youtube.com/watch?v=bCIcq1zESKk)  
[What's new in Sales Lines suggestions with Copilot](https://www.youtube.com/watch?v=_1LhwG2ZgFw)  

And for more videos on all of the new functionality in the application, consider these videos:

[What's new: Subscription Billing](https://www.youtube.com/watch?v=jJxBswIy_Xw)  
[What's new: Concurrency in Warehousing](https://www.youtube.com/watch?v=QfOgUCXg94o)  
[What's new: Enhancements to Job Queue](https://www.youtube.com/watch?v=fHi8ohBlZro)  
[What's new: Get notified of issues with Job Queues](https://www.youtube.com/watch?v=efoFM5uiCxg)  
[What's new: Field Service Integration to Service Management](https://www.youtube.com/watch?v=WvG4EOHQuiw)  
[What's new: Financial analytics](https://www.youtube.com/watch?v=5RJ3yZ7m1UU)  
[What's new: Project and Service management](https://www.youtube.com/watch?v=pEXl-POet_4)  
[What's new: Shopify Connector](https://www.youtube.com/watch?v=p-pwG6f5srY)  
[What's new: Financial Management](https://www.youtube.com/watch?v=YVViIBPui-A)  
[Introduction in Multiple VAT Numbers for Customers](https://www.youtube.com/watch?v=fdzTWZyT6mI)  
[What's new in E-Documents](https://www.youtube.com/watch?v=hba7KVWrIwY)  
[What's new in Sustainability](https://www.youtube.com/watch?v=NYG4pOtW-Xw)  

We hope you'll find this useful. If you have any feedback, please let us know.

# 2024-09-05 Get your AppSource and per-tenant apps ready for the next major release (2024 release wave 2)

We're approaching yet another major release, and as developers and solution architects, you play a pivotal role in ensuring a seamless upgrade experience for our shared customers. Here we want to repeat some of the key best practices for getting ready for the new major release, and call out some changes for AppSource apps from this release going forward.

## AppSource apps

As for previous releases, one month before the next major release (i.e., from today), we no longer accept AppSource app submissions that are incompatible with the upcoming version. Thus, please start identifying and addressing compatibility issues already now, to handle them proactively, avoiding last-minute firefighting and disruption. If your AppSource submission fails, we push detailed results to the AppInsights for the AppSource app, if that has been provided in the app.json file. You can read more about how to do that and available submit signals here: [Analyzing AppSource submission validation telemetry](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/administration/telemetry-appsource-submission-validation-trace?wt.mc_id=d365bc_inproduct_alextension).

We also start checking the existing, installed AppSource apps for compatibility with the next major release. In previous releases we published validation results to a public URL where you could check results for you app by providing an appId, but we're no longer supporting this. Instead, we also publish these results to a provided AppInsights for the AppSource app. The relevant signals here are `LC0230` to `LC0237`.
As a best practice, however, don't just rely on checking the results of our validation, but perform your own, in your pipelines. For more information, see documentation on [technical validation](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-checklist-submission?wt.mc_id=d365bc_inproduct_alextension).

In our recent release, we introduced the ability to hotfix older versions of AppSource apps. This means you can continue patching your apps for previous Business Central versions while simultaneously working on the new version targeting the next major release. Your customers running on the previous versions of your apps will therefore not be left behind and get the support they need. Find more information about hotfixing AppSource apps [here](https://learn.microsoft.com/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/hotfix-older-appsource-apps).

## Per-tenant extensions

Again, as for previous releases, one month prior to the major release (i.e., now), our system starts notifying customers when their per-tenant extensions are incompatible with the next major release. The notifications are sent via email, to the recipients registered in Business Central Admin Center and via messages in the Microsoft 365 Message Center. Use this information to prioritize fixing your per-tenant extensions, to avoid the risk of disruptions, escalations and dealing with requests to postpone updates. Find more information about our per-tenant validation [here](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-customization-update-lifecycle#automated-extension-validation?wt.mc_id=d365bc_inproduct_alextension).

Business Central makes a preview version available that allows you to create a sandbox environment available for all customers, one month prior to the major release date. Use this option to upload and test your extensions proactively. Read more about preview environments [here](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/administration/preview-environments?wt.mc_id=d365bc_inproduct_alextension).

## Get ahead of the game with DevOps solutions

Business Central provides both AppSource and per-tenant extension builders with an easy to use, rich and secure DevOps solution: AL-Go for GitHub. Find more information [here](https://github.com/microsoft/AL-Go).

Among many other capabilities, AL-Go for GitHub allows developers to easily check compatibility of their apps with any upcoming version, whether minor or major, in real-time with these changes being introduced by Business Central team. Start using this solution or other DevOps solutions available in the Business Central ecosystem to handle compatibility proactively.

By adhering to these technical best practices, you contribute to a thriving ecosystem. Prepare early, prioritize quality, and deliver exceptional solutions to our mutual customers. Thank you for helping us shape the future of Business Central!

More information:

- [Maintain AppSource apps and per-tenant extensions](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/app-maintain?wt.mc_id=d365bc_inproduct_alextension)
- [Lifecycle of apps and extensions](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-app-life-cycle?wt.mc_id=d365bc_inproduct_alextension)
- [Update Lifecycle for Tenant Customizations](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-customization-update-lifecycle?wt.mc_id=d365bc_inproduct_alextension)
- [Technical validation FAQ](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-checklist-submission-faq?wt.mc_id=d365bc_inproduct_alextension)


# 2024-06-04 Help the Dynamics 365 Business Central team assess the usage of DevOps solutions

DevOps is a vital part of every development project and helps ensure consistency and quality of your solutions. In Business Central we're currently running a survey to assess, which DevOps solutions partners are using, and what challenges they're facing.

Please join our survey and provide your feedback here, before June 18, 2024: [Survey](https://forms.office.com/r/ZmFBTA9t7D)

# 2024-05-01 Business Central 2024 release wave 1 launch event content for developers

In April 2024, the Business Central 2024 release wave 1 launch event went live with videos on the latest innovations for Business Central to you through an all-access digital experience. They contain high-quality content presented by product leaders to enable you to learn how to take Business Central to the next level as a developer. All 100% free. All you need to do is to visit the [Business Central Youtube channel](https://www.youtube.com/@MicrosoftDynamics365BC) and then set aside time to learn and digest. There's a lot of content, so maybe set aside 20 minutes every morning before you open your email. We guarantee you that it will be worth the time.

These are the sessions that we think are most relevant for you as a developer and where you should start your learning journey:

- [What's new: Developer tools](https://www.youtube.com/watch?v=tzeO0mc8RJo)  
- [What's new: Extending Copilot using AL code](https://www.youtube.com/watch?v=ytYKvn2MiGs&t=18s)  
- [What's new: Designing generative AI experiences](https://www.youtube.com/watch?v=qP0id91bIlA)
- [What's new: Key updates in our learning content (documentation) for developers](https://www.youtube.com/watch?v=mnxOSl1Y9PI)  
- [What's new: Excel layouts for developers](https://www.youtube.com/watch?v=BofJJPqgrTI)  
- [What's new: Introducing the Business Foundation and the No. Series module](https://www.youtube.com/watch?v=kbRTIWH-nio)
- [What's new: Going Open Source with the new GitHub repository for Business Central](https://www.youtube.com/watch?v=tjHDcjwsOIE)
- [In preview: User acceptance testing with the Page Scripting tool](https://www.youtube.com/watch?v=B8cWQGwajwQ)

If AI and Copilot rock your boat, consider diving more into the topic with these sessions:

- [Introducing: Chat with Copilot](https://www.youtube.com/watch?v=j5ULVClJaKU)
- [Introducing: AI-powered analysis with Copilot](https://www.youtube.com/watch?v=mHrY_OI0qNo)
- [Introducing: Sales lines suggestions with Copilot](https://www.youtube.com/watch?v=cZCSi6khZFo)
- [What's new: Extending Copilot using AL code](https://www.youtube.com/watch?v=ytYKvn2MiGs)  
- [What's new: Designing generative AI experiences](https://www.youtube.com/watch?v=qP0id91bIlA)

You might also want to dive deeper into the Business Central platform, and learn about the server, database, resource governance (in the online version of Business Central), and troubleshooting with telemetry:

- [What’s new: AL runtime and database](https://www.youtube.com/watch?v=OLN-2Ec2GMM)
- [What's new: Web services in Business Central](https://www.youtube.com/watch?v=VpNQ-CYNrkM)

After you've seen/browsed those sessions, consider spending some time in the Application track. We think that these sessions are particularly useful for developers (or you can just be a hero and send some links to your functional consultant friends): 

- [What's new: Excel reports for finance and sales](https://www.youtube.com/watch?v=gMyp9JkXf9g)
- [Introducing: Sustainability in Business Central](https://www.youtube.com/watch?v=_ynMUzh956w)
- [What's new: E-Documents](https://www.youtube.com/watch?v=kAFdLxb2ghc)
- [What's new: Cost Adjustment](https://www.youtube.com/watch?v=w0okH0v0VvY) 
- [What's new: Service Management](https://www.youtube.com/watch?v=N8Unj6WLB6U)
- [What's new: Project Management](https://www.youtube.com/watch?v=dD_2NEs3A40) 
- [What's new: Financial management - Overview](https://www.youtube.com/watch?v=HI7VcPzR2OE)
- [What's new: Financial management - Reminder Automation](https://www.youtube.com/watch?v=UTxX4XPLcgQ) 
- [What's new: Financial management - G/L Account Revaluations](https://www.youtube.com/watch?v=u1oO9MEg9kc) 
- [What's new: Entering and approving time sheets](https://www.youtube.com/watch?v=MgWlmZAlqGI)
- [What's new: Business Central Mobile App and Barcode Scanning](https://www.youtube.com/watch?v=W2yhU8eXT5w) 
- [What's new: Automated IRS1099 reporting](https://www.youtube.com/watch?v=WI_3mjpQ2JU) 
- [What's new: The Danish Bookkeeping Act](https://www.youtube.com/watch?v=hcu7T3qLdDA)

If you want to dive more into ways to integrate Business central with other services, such as Microsoft Power Platform, Power BI, Microsoft 365, or Shopify, then check out these sessions:

- [What's new: Key updates in learning content (docs) for systems architects and integration developers](https://www.youtube.com/watch?v=gAzmWJg9Z5g)
- [What's new: Business Central Integration with Power Platform](https://www.youtube.com/watch?v=V_ZyGeF5JXE)
- [What's new: Using Power Pages with Business Central](https://www.youtube.com/watch?v=auoHUd24Gfw)
- [What's new: Business Central Integration with Dataverse](https://www.youtube.com/watch?v=-q8Gm7u7R2A)
- [What's new: Shopify Connector B2B Functionality](https://www.youtube.com/watch?v=3tmaVpPTQLw)
- [Introducing: Dynamics 365 Field Service Integration with Business Central](https://www.youtube.com/watch?v=ByRoL46n-Gg)
- [Introducing: Create Power Automate flows with Copilot](https://www.youtube.com/watch?v=T63y0F_38SI)

If you also spend time administering environments, check this out session: 

- [What's new: Governance & Administration](https://www.youtube.com/watch?v=kAwI0EGSyls)

That's all folks! Go learn. Get smart. Be awesome. Help customers.

## 2024-03-12 Want to know how things work? Learn how Business Central integrates to other Microsoft services and products

As developers and solution architects, developing in AL is likely only part of your job. In a world where customers operate in the cloud, integration to other Microsoft services and products is an increasingly important part of Business Central implementations. As children, many of you probably asked a lot of “how does that work?” questions and might have read the book “The way things work” by David Macaulay to satisfy your curiosity. In the Business Central product group we're no different and we asked ourselves: “Why not write the: The way Business Central integrations work" article to give an overview on, which integrations are currently possible and how they work.  

![Shows how Business Central integrates to Microsoft 365](https://raw.githubusercontent.com/microsoft/AL/master/resources/all-integrations.png)

We added new content on the following topics:

- [Overall integration overview](https://aka.ms/bcintegration?wt.mc_id=d365bc_inproduct_alextension)
- [Integrations to Office/M365](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/m365-integration-overview?wt.mc_id=d365bc_inproduct_alextension)
- [Integrations to Power Platform](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/powerplatform/powerplatform-integration-overview?wt.mc_id=d365bc_inproduct_alextension)
- [Integrations to Dataverse](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/dataverse-integration-overview?wt.mc_id=d365bc_inproduct_alextension)
- [Integrations to Azure](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/integration-azure-overview?wt.mc_id=d365bc_inproduct_alextension)
- [Integrations to infrastructure services](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/integration-infrastructure-overview?wt.mc_id=d365bc_inproduct_alextension)

Want to check it out? Then start by visiting the new overview article [aka.ms/bcintegration](https://aka.ms/bcintegration?wt.mc_id=d365bc_inproduct_alextension).

That's all for now, folks!

Most of these suggestions we added because you gave us feedback on things you'd like to see in this part of docs. Keep the feedback coming, together we can make docs a really useful tool for AL developers.


# 2024-02-28 Working on AppSource apps and per-tenant extensions? Get ready for the next major release

As developers and solution architects, you play a pivotal role in shaping the Business Central ecosystem. We count on you to facilitate a seamless experience for our shared customers as they move to the upcoming major release. Here we want to list some of the key best practices for getting ready for the new major release. 

## AppSource apps 

One month before the next major release, we cease accepting AppSource apps that are incompatible with the upcoming version. Please start identifying and addressing compatibility issues already now, to handle them proactively, avoiding last-minute firefighting and disruption. 

We also start checking the existing AppSource apps for compatibility with the next major release, and publish validation results weekly to a public URL `(aka.ms/readyForNextMajor?appId=<appId>)`, making it easier for you to assess your app’s readiness for the next release. However, as best practice, don't just rely on checking the results of our validation, but perform your own, in your pipelines. For more information, see documentation on [technical validation](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-checklist-submission?wt.mc_id=d365bc_inproduct_alextension). 

In our recent release, we introduced the ability to hotfix older versions of AppSource apps. This means you can continue patching your apps for previous Business Central versions while simultaneously working on the new version targeting the next major release. Your customers running on the previous versions of your apps will therefore not be left behind and get the support they need. Find more information about hotfixing AppSource apps [here](https://learn.microsoft.com/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/hotfix-older-appsource-apps?wt.mc_id=d365bc_inproduct_alextension). 

## Per-tenant extensions  

Also, one month prior to the major release, our system starts notifying customers when their per-tenant extensions are incompatible with the next major release. The notifications are sent via email, to the recipients registered in Business Central Admin Center and via messages in the Microsoft 365 Message Center. Use this information to prioritize fixing your per-tenant extensions, to avoid the risk of disruptions, escalations and dealing with requests to postpone updates. Find more information about our per-tenant validation [here](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-customization-update-lifecycle#automated-extension-validation?wt.mc_id=d365bc_inproduct_alextension).  

Business Central makes a preview version available that allows you to create a sandbox environment available for all customers, one month prior to the major release date. Use this option to upload and test your extensions proactively. Read more about preview environments [here](https://aka.ms/bcpreview?wt.mc_id=d365bc_inproduct_alextension).  

## Get ahead of the game with DevOps solutions 

Business Central provides both AppSource and per-tenant extension builders with an easy to use, rich and secure DevOps solution: AL-Go for GitHub. Find more information [here](https://github.com/microsoft/AL-Go).

Among many other capabilities, AL-Go for GitHub allows developers to easily check compatibility of their apps with any upcoming version, whether minor or major, in real-time with these changes being introduced by Business Central team. Start using this solution or other DevOps solutions available in the Business Central ecosystem to handle compatibility proactively.  

By adhering to these technical best practices, you contribute to a thriving ecosystem. Prepare early, prioritize quality, and deliver exceptional solutions to our mutual customers. Thank you for helping us shape the future of Business Central! 

## More information

- [Maintain AppSource apps and per-tenant extensions](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/app-maintain?wt.mc_id=d365bc_inproduct_alextension)
- [Lifecycle of apps and extensions](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-app-life-cycle?wt.mc_id=d365bc_inproduct_alextension)
- [Update Lifecycle for Tenant Customizations](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-customization-update-lifecycle?wt.mc_id=d365bc_inproduct_alextension)
- [Technical validation FAQ](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-checklist-submission-faq?wt.mc_id=d365bc_inproduct_alextension)

# 2024-01-25 Document reporting with Word layouts documentation just got better!

Over the last weeks, we've worked on improving the developer documentation for Word layouts in Dynamics 365 Business Central.

You find the all the Word layout content in the developer docs in the table of contents under **Development**, choose **Programming in the AL language**, then **Developing reports**, **Report layouts**, **Excel, Word, and RDL report layouts** and then **Creating an Excel layout report**.
 
So what did we do? Well, quite a lot...
 
We added new content on the following topics:

- How to iterate a Word layout over a dataitem (also expanded the article on how WordMergeDataItem works)
- How to create a new Word layout from Visual Studio Code
- How to do totals
- How to use headers/footers, sections, and watermarks
- How to use fonts
- How to use hyperlinks
- How to use tables to control alignment of text and images
- How to work with pictures in Word layouts
- Changing layout properties such as margins or orientation
- Designing layouts for precision printing
- How to use the same table style for all tables in the layout
- Design guidelines for a report dataset designed for Word layouts
- Difference between RDL and Word layouts
- More content on how to use Office document themes
- How to use tables to display data from the report dataset (simple repeaters)
- How to use lists to display data from the report dataset (simple repeaters)
- How to use nested repeaters to display data from nested dataitems in the report dataset
- How to do sub totals/running totals
- How to do conditional formatting
- Operational limits for reports with Word layouts
- How to convert an RDL layout to a Word layout

Want to check it out? Then start by visiting the [Creating an Word layout report](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-howto-report-layout?wt.mc_id=d365bc_inproduct_alextension) article.

That's all for now, folks!

Most of these suggestions we added because you gave us feedback on things you'd like to see in this part of docs. Keep the feedback coming, together we can make docs a really useful tool for AL developers.

# 2024-01-11 Error handling documentation just got better!
 
Over the last months, we've worked on improving the developer documentation for error handling in Dynamics 365 Business Central.
 
You find the all the error handling content in the developer docs in the table of contents under **Development**, choose **Programming in the AL language**, and then **Error handling**.
 
So what did we do? Well, quite a lot...
 
- All articles related to error handling (that we're aware of) are now present under **Error handling** in the table of contents.
- All articles about error handling (that we're aware of) have been updated to reflect latest language features and to include AL example code.
- New article *Failure modeling and robust coding practices* with two techniques that you can use to make your code more robust towards errors: **failure modeling** and **robust coding practices**.
- Article *Understanding the error dialog* is updated with a section on how to understand the information in Copy details section. Also a new section explaining how to understand a AL stack trace.
- New article *User experience guidelines for errors* that offers guidance on how to formulate good error messages, both for older versions of Business Central and for versions supporting the *actionable errors* framework.
- New article *Actionable errors* that offers guidance on how to handle error dialogs in AL code, specifically how to use the *actionable errors* framework to provide recommended actions to users to resolve errors more effectively.
- All four articles for telemetry related to errors are available in the *Error telemetry* part of the table of contents.
- All articles from the AL Language reference documentation (related to error handling) are present in the table of contents and all reference articles have been updated to reflect latest language features and to include examples of robust coding practices.
- All articles from the Base App reference documentation (related to error handling) are also present in the table of contents.
  
Want to check it out? Then start by visiting the new [Error handling](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-al-error-handling?wt.mc_id=d365bc_inproduct_alextension) overview.
 
That's all for now, folks!
 
Most of these suggestions we added because you gave us feedback on things you'd like to see in this part of docs. Keep the feedback coming, together we can make docs a really useful tool for AL developers.

# 2023-12-13 Curious about integrating AI using developer tools for copilot?

With the latest refresh of the documentation, we've added content on how to build a copilot user experience for Business Central. Read about the developer tools, how to get set up with Azure OpenAI service, and how to build the copilot capability and experience in Business Central.

Get started with the [Integrating AI using Developer Tools for Copilot](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/ai-integration-landing-page?wt.mc_id=d365bc_inproduct_alextension) landing page. And check out the refreshed [System application](https://learn.microsoft.com/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-completion-params?wt.mc_id=d365bc_inproduct_alextension) documentation.

We hope you'll find this useful. If you have any feedback, please let us know.

# 2023-12-08 Reporting documentation just got better!

Over the last months, we've worked on improving the developer documentation for *reporting* in Dynamics 365 Business Central.

You find the all the reporting content in the developer docs in the table of contents (TOC) under **Development**, choose **AL Language**, and then **Developing reports**. 

So what did we do? Well, quite a lot...

1. All articles related to reporting (that we're aware of) are now present under Developing reports in the TOC.
1. All articles about reports (that we're aware of) have been updated to reflect latest language features and to include AL example code.
1. New content on how to format report data (both TOC entry and a new article).
1. The Report layouts section in the TOC now also includes all layout articles from the user part of the Business Central documentation.
1. New content on report discoverability added (both a new TOC entry and a new article).
1. New article on report troubleshooting added.
1. All articles from the AL Language reference (related to reports) are present in the TOC and all reference articles have been updated to reflect latest language features and to include examples of robust coding practices.

Want to check it out? Then visit the [Reports overview](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-reports?wt.mc_id=d365bc_inproduct_alextension). And don't miss the latest blog post on LinkedIn about [The world is changing (in Business Central reporting)](https://www.linkedin.com/pulse/world-changing-business-central-reporting-kennie-nybo-pontoppidan-rd0wf/?trackingId=UcbBit2mQ0yDdfedNP4Z3w%3D%3D).

That's all for now, folks!

Most of these suggestions we added because you gave us feedback on things you'd like to see in this part of docs. Keep the feedback coming, together we can make docs a really useful tool for AL developers.


# 2023-11-16 Are you looking into creating generative AI solutions for Business Central? 

Then read on here. As you move forward with exploring generative AI, we’ve published a couple of articles to get you started. There's a new article for the [PromptDialog page type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-page-type-promptdialog?wt.mc_id=d365bc_inproduct_alextension) and we've also updated the reference documentation for the following properties:

[PromptMode](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-promptmode-property?wt.mc_id=d365bc_inproduct_alextension)

[IsPreview](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-ispreview-property?wt.mc_id=d365bc_inproduct_alextension)

[PageType](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-pagetype-property?wt.mc_id=d365bc_inproduct_alextension)

This serves as a starting point for other documentation that we’ll be shipping on how to get started developing a generative AI solution with Business Central.

Remember that you can go to the [aka.ms/BCTech](https://www.github.com/BCTech/samples/AzureOpenAI) repo to discover more and maybe get inspired.

At Directions EMEA 2023, the keynote presentations demonstrated how Business Central has integrated AI to enhance productivity. Check these recordings out [here](https://dynamicspartners.transform.microsoft.com/products/dynamics-365-business-central).

Stay tuned!

# 2023-11-09 Refresh of the system and base application reference

We've just refreshed the system and base application reference documentation for Business Central version 23, (base application version 23.0.12034.12416, system application version 23.0.12034.12416).

This refresh includes namespaces and the system level as well. To browse the reference library, go to [System and Base Application Reference for Dynamics 365 Business Central](https://learn.microsoft.com/dynamics365/business-central/application/?wt.mc_id=d365bc_inproduct_alextension).

# Business Central 2023 release wave 2 launch event content for developers
 
In October 2023, Business Central 2023 release wave 2 launch event went live with videos on the latest innovations for Business Central to you via an all-access digital experience. They contain high-quality content presented by product leaders to enable you to learn how to take Business Central to the next level as a developer. All 100% free. All you need to do is to sign up and log in at the event site [aka.ms/bcle](https://aka.ms/bcle) and then set aside time to learn and digest. There's a lot of content, so maybe set aside 20 minutes every morning before you open your email. We guarantee you that it will be worth the time.

These are the sessions that we think are most relevant for you as a developer and where you should start your learning journey
- [What's new in Developer Tools](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDc=)
- [What's new in AL-Go for GitHub](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDA=)
- [What's new: Performance testing before go-live with Performance Toolkit](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDU=)
- [What's new: Power BI and reporting (for developers)](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDM=)

You might also want to dive deeper into the Business Central platform, and learn about the server, database, resource governance (in the online version of Business Central), and troubleshooting with telemetry
- [What's new in Server and Database - a faster runtime](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1ODU=)
- [What's new in Server and Database - a faster data stack](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1ODc=)
- [What's new in Server and Database - more stable web services](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1OTM=)
- [What's new in Server and Database - new reporting capabilities](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1OTA=)
- [What's new in resource governance for Dynamics 365 Business Central online](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1OTU=)
- [What's new in telemetry](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1ODQ=)

After you've seen/browsed those sessions, consider spending some time in the *Application* and *Onboarding and user experience* tracks. We think that these sessions are particularly useful for developers
- [Creating customer centric onboarding experiences](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDI=)
- [What's new: Add existing field in pages](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MTI=)
- [What's new: Productivity features in the web client](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MTQ=)
- [Introducing Analyze data on lists on queries](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDk=)

If you want to dive more into ways to integrate Business central with Microsoft Power Platform, Power BI, and Microsoft 365, then check out these sessions
- [What's new: Business central integration with Power Platform](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1OTY=)
- [What's new in Dataverse and Dynamics 365 app integration - Part 1](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU1OTk=)
- [What's new in Dataverse and Dynamics 365 app integration - Part 2](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDE=)
- [What's new: Power BI and reporting (for developers)](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjU2MDM=)

That's all folks! Go learn. Get smart. Be awesome. Help customers.

# 2023-10-04 Business Central 2023 release wave 2 launch event content for developers

Join the product team on October 10-12th, 2023 to see what’s new in Dynamics 365 Business Central 2023 release wave 2 at the Business Central Launch Event; a free virtual event for everyone from reselling partners to consultants, and ISV partners. 
 
We're hosting live Q&As on these topics that might interest you as a developer:

- What's new in developer tools 
- What's new in AL-Go for GitHub
- What's new: Performance testing before go-live with Performance Toolkit
- What's new: Power BI and reporting (for developers)
- Creating customer-centric onboarding experiences
- Add an existing field
- What's new in server and database
- What's new in resource governance for Dynamics 365 Business Central online
- What's new in telemetry
- What's new in Dataverse and Dynamics 365 app integration - Part 1
- What's new in Dataverse and Dynamics 365 app integration - Part 2
 
Join us! Register today at [aka.ms/BCLE](https:/aka.ms/BCLE).

# 2023-09-07 Business Central 2023 release wave 2 release notes for developers

We just updated the release notes for Business Central 2023 release wave 2, and with the preview coming out soon, this is a perfect time to get updated on the development additions, try them out and provide feedback.

First, you can now very easily get the latest build of the AL Language for Microsoft Dynamics 365 Business Central, directly from the Visual Studio Code Marketplace, by simply just switching between public and pre-release versions.   
[Get the AL Language extension in pre-release versions on Visual Studio Code Marketplace](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/get-al-vsix-preview-versions-visual-studio-code-marketplace)

Namespaces have finally arrived, and will make it easier to structure apps, create better object names, and avoid identifier clashes, and eventually in a later release allow moving away from affixes. First party apps have uptaken namespaces, and the AL Explorer allows filtering to view objects by namespace.  
[Segment AL code and reduce naming conflicts with namespaces](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/segment-al-code-reduce-naming-conflicts-namespaces)

We know it can be challenging and tedious to set up Visual Studio Code for an environment to investigate or troubleshoot. With this release, developers and consultants can now easily provision a matching Visual Studio Code for a production or sandbox environment directly from within the web client.  
[Open Visual Studio Code from web client to investigate or troubleshoot extensions](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/open-visual-studio-code-web-client-investigate-or-troubleshoot-extensions)

Our built-in rich text editor supports all media fields in Business Central, and developers can also customize rich text capabilities for their extensions and applications.  
[Use the built-in rich text editor to enter data](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/use-built-in-rich-text-editor-enter-data)

Field group extensibility is one of our larger and highly voted gaps, and in this release we have added the ability to define field groups in table extensions for tables not originally having a field group.  
[Add a new FieldGroup to an existing table](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/add-new-fieldgroup-existing-table)

To help you protect specific variable data so that other parties can't access it during debugging, we have introduced a SecureText type.
[Use SecretText type to protect credentials and sensitive textual values from being revealed in debug sessions](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/new-securetext-string-type-store-variable-secrets-that-should-not-be-debugged)

We have also added a number of IntelliSense additions and project features to help your everyday productivity.  
- [Get inlay hints in source editor for AL method parameters and return types](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/get-inlay-hints-source-editor-al-method-parameters-return-types)  
- [Hover over label variable to see text string value](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/hover-over-label-variable-see-text-string-value)  
- [Get IntelliSense for adding variables in Visual Studio Code AL debugger console](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/get-intellisense-adding-variables-visual-studio-code-al-debugger-console)  
- [Get smarter method signature recommendations in IntelliSense](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/get-smarter-method-signature-recommendations-intellisense)  
- [Show list of keys while working on AL code](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/show-list-keys-while-working-al-code)  
- [Set new output folder setting for storing app files at AL project build](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/set-new-output-folder-setting-storing-app-files-at-al-project-build)  


When it comes to data analysis and reporting, we give you have more control, you can now turn off Analysis Mode on pages and specify how to embed content from Power BI.  
[Turn off data analysis mode on pages and queries](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/turn-off-data-analysis-mode-pages-queries)

For AppSource, the first wave of transact support with per-user licensing and credit card purchase in the AppSource Marketplace will release to public. Later this fall we are enabling ISVs to organize a preview for their AppSource apps for a controlled audience of their customers.  
- [Sell Business Central apps through AppSource](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/sell-business-central-apps-through-appsource)  
- [AppSource ISV publishers can preview their AppSource apps with select customers](https://learn.microsoft.com/en-us/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/appsource-isv-publishers-preview-their-appsource-apps-select-customers)

That is already a comprehensive list, but wait, there is even more! Next round of release notes will include entries for the following: 
- AL Extension for Linux in preview - in fact this is already out, just install the extension from [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al) in your Visual Studio Code installation on Linux.  
- ALDoc preview for partners, read more about that here [Generating help with the ALDoc tool](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/help/help-aldoc-generate-help).
- AL syntax highlighting for DevOps.
- Teaching tooltips on report request pages.
- Set the default folder location for new AL projects.
- Track source and build metadata from DevOps pipelines in extension app.json.
- Choose between more sampling intervals for snapshot and in-client profiling.
- Use **Find all references** for triggers, system methods, and trigger events on page fields, table fields, page actions, and table methods/triggers/events.

# 2023-08-29 Enhancements to the HttpClient data type documentation

Over the last months, we've worked on improving the developer documentation for how to use the HttpClient data type to do outgoing web calls from AL in Dynamics 365 Business Central.

First of all, we made the topic a first class citizen in the developer docs, by adding a new section in the table of contents (TOC) under **AL Platform** plus a new overview article, where we did the following:

- Explain high-level details on how to set up an external call (including how to use request and content headers), run it, and parse the result from the service. All three sections come with sample AL code that also tries to showcase how to write AL code, which is resilient towards failures.
- Document the supported HTTP methods (and this information is reused in relevant other pages).
- Explain HTTP status codes and include a troubleshooting guide on common HTTP status codes for client errors (4xx).
- Show how you can use certificates in your requests.
- Explain how to troubleshoot outgoing web calls with telemetry.
- Give guidance on performance impact for UI sessions of outgoing calls.

For more information, read more in [Call external services with the HttpClient data type](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-httpclient?wt.mc_id=d365bc_inproduct_alextension).

Second, we updated the existing overview article for the HttpClient data type with a new section on how HttpClient calls can fail and why it's important to react to return values of the methods HttpClient.Delete, HttpClient.Get, HttpClient.Post, HttpClient.Put, or HttpClient.Send. We also highlight how AllowHttpClientRequests works in online sandboxes. Read more [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-data-type#ways-that-httpclient-calls-can-fail?wt.mc_id=d365bc_inproduct_alextension).


Third, the existing article on the HttpContent data type got a new section on content headers, including the information that we always have a default content header for `Content-Type`, namely `text/plain; charset=utf-8`. Read more on the [HttpContent data type](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpcontent/httpcontent-data-type#content-headers?wt.mc_id=d365bc_inproduct_alextension).

Fourth, each of the existing articles on the methods HttpClient.Delete, HttpClient.Get, HttpClient.Post, HttpClient.Put, and HttpClient.Send methods got two new sections:

- Ways that HttpClient.XXX calls can fail
- Example sample AL code

The only two exceptions are the articles for HttpClient.Send and for HttpClient.Post:

- For HttpClient.Send, the generic examples shows how to do HTTP `PATCH` requests as this HTTP method currently doesn't yet have its own wrapper method. For more information on Httpclient.Send, see [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-send-method#example-http-patch?wt.mc_id=d365bc_inproduct_alextension).
- For HttpClient.Post, we threw in examples on how to use multipart/form-data in two examples on how to upload/stream files (either text or binary files). For more information on Httpclient.Post, see [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-post-method#example-how-to-upload-a-file-using-multipartform-data?wt.mc_id=d365bc_inproduct_alextension).

That's all for now, folks!

Most of these suggestions we added because you gave us feedback on things you would like to see in this part of docs. Keep the feedback coming, together we can make docs a really useful tool for AL developers.

# 2023-08-22 Business Central 2023 release wave 1 launch event content for developers
 
In April 2023, Business Central 2023 release wave 1 launch event went live with videos on the latest innovations for Business Central to you via an all-access digital experience. High-quality content presented by product leaders to enable you to learn how to take Business Central to the next level as a developer. And it's all for free. All you need to do is to sign up and login at the event site [aka.ms/bcle](https://aka.ms/bcle) and then set aside time to learn and digest. There's a lot of content, so maybe set aside 20 minutes every morning before you open your email. We guarantee you that it will be worth the time.

These are the sessions that we think are most relevant for you as a developer and where you should start your learning journey:

- [What's new in VS Code and AL](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDcwMDc=)
- [What's new in Server and Database](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5Mjg=)
- [What's new in telemetry](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5NTE=)
- [What's new in AL-Go for GitHub](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5NTQ=)
- [Introducing AppSource transactability for Business Central apps](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5Nzk=)

After you have seen/browsed those sessions, consider spending some time in the **Application and user experience** track. We think that these sessions are particularly useful for developers:

- [What's new: Work more productively with actions](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDcwNzA=)
- [Introducing data analysis](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY4OTQ=)
- [What's new in the web client](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDczODk=)

If you want to dive more into ways to integrate Business central with Microsoft Power Platform and Microsoft 365, then check out these sessions:
- [Introducing: Best practices for building Power Apps based solutions for Business Central](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDc2MDA=)
- [What's new in Power Platform integrations](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5NzE=)
- [What's new in Virtual Table for Microsoft Dataverse](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDcxMzQ=)
- [What's new in Power Automate and approval workflows](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDcwMDQ=)
- [What's new in Teams integration](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5ODQ=)

And if you also work with tenant administration, go check out these videos related to Governance and administration:

- [What's new in administration](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY4OTg=)
- [What's new in cloud migration](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5MTM=)
- [Get data-driven with telemetry](https://app.hopin.com/events/business-central-launch-event-4eb37891-3940-40a3-a49d-b48c6350c82d/replay/TGl2ZXN0cmVhbVJlY29yZGluZzo4MDY5ODA=)

That's all folks! Go learn. Get smart. Be awesome. Help customers.

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
