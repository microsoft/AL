# Purpose
This AL extension is showing how to take advantage of Page Background Tasks in Business Central.

# Page Background Task
A page background task can run a codeunit (without a UI) in a read-only child session of the page session. On completion of the task, a completion trigger with the result is invoked on the page session.

If the page is closed before the task completes or the page record ID changed, the task is canceled.

# Requirement
Business Central 2019 wave 2 release (Also known as version 15)

# How to run
Clone the repository, build the extension and publish it to your sandbox.

**On the Role Center 9022 (Business Manager Role Center), two cues will appears:**
* EUR/DKK - Latest
* EUR/USD - Latest

**In the "Currencies" list page, two factboxes will appear:**
* "Latest currency rates"
* "Latest currency rates repeater"

**A setup page:**
* "Page Background Task Sample currency setup" : To setup the delays for demo purposes

# Design

The code unit "CurrencyRetriever" is running in a child session of the parent session.
The parent session continues to run, not affected by  the child session (if it blocks for example, performing an extensive operation/waiting for IO).

The important concept to understand is the "link" between the page current record, and the page background task.
**If CurrPage.Rec changes, the PBT is automatically cancelled.**

In "O365 Activities Ext Currency", the PBT is enqueued on OnAfterGetCurrRecord(), and therefor is linked to the current page record. ("Activities Cue" record)

In "Latest Rates Factbox",  the PBT is enqueued on OnAfterGetCurrRecord(), and therefor is linked to the current page record, which is set to the parent page record by the SubPageLink property on the "Currencies PageExt" list.

In "Latest Rates Factbox wRepeater", the PBT is enqueued on OnAfterGetCurrRecord() of "Currencies PageExt" list. The reason is that the factbox doesn't have a single record (due to the repeater), and therefor the PBT cannot be instantiated from the factbox. The PBT is linked to the currently selected record in the list.

