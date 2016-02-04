---
layout: post
title: Blocking Attachments With Executable Content
categories:
- Messaging
comments: true
---
I don't know whats going on in the past few weeks but the sheer amount of zeroday exploits via email have risen. To protect yourselves against this I would recommend setting up a transport rule to drop or reject any email with executable content. This can be done for Exchange 2013 or Office365 (Exchange Online).

1. Login to Exchange Admin Center using administrative credentials
2. On the left pane select "Mail flow"
3. On the top pane select " Rules"
4. Click on the "+" sign and select create a new rule
5. Give a name to the rule and select "more options" at the bottom of the page.
6. Under <strong>"Apply the rule if"</strong> Select <strong>"Any attachment has executable content"</strong>
7. Under <strong>"Do the following"</strong> Select "Reject the message with explanation" and input your text.
8. Save the rule.
