# Purpose
This AL extension is showing how to take advantage of Page Background Tasks in Business Central.

# Page Background Task
A page background task can run a codeunit (without a UI) in a read-only child session of the page session. On completion of the task, a completion trigger with the result is invoked on the page session.

If the page is closed before the task completes or the page record ID changed, the task is canceled.

# Requirement
Business Central Fall Release 2019 (Also known as version 15)

# How to run
Clone the repository, build the extension and publish it to your sandbox.

**On the Role Center 9022 (Business Manager Role Center), two cues will appears:**
* EUR/DKK - Latest
* EUR/USD - Latest

**In the "Currencies" list page, a factbox will appear:**
* "Latest currency rates"

**A setup page:**
* "Demo AL Currency Setup" : To setup the delays for demo purposes

# Design

The code unit "CurrencyRetriever" is running in a child session of the parent session.
The parent session continues to run, not affected by  the child session (if it blocks for example, performing an extensive operation/waiting for IO).

The important concept to understand is the "link" between the page current record, and the page background task.
**If CurrPage.Rec primary key changes, the PBT is automatically cancelled.**

In "O365 Activities Ext Currency", the PBT is enqueued on OnAfterGetCurrRecord(), and therefor is linked to the current page record. ("Activities Cue" record)

In "Currencies PageExt", the PBT is enqueued on OnAfterGetCurrRecord(), and therefor is linked to the currently selected record of the list. Changing the record in the list will cancel the page background task automatically.

