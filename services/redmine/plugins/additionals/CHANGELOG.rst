Changelog
=========

2.0.13
++++++

- FontAwesome 5.2.0 support
- smiley support for markdown text_formatting
- new_issue macro with i18n support
- updated bootstrap-datepicker to v1.8.0
- updated d3plus to v2.0.0-alpha.17
- ruby 2.2.0 is required
- Redmine 3.4 is required
- support sidebar with non default wiki titles (thanks to @danielvijge)

2.0.12
++++++

- Provide d3 loader function
- More robust code for dealing with finding data

2.0.11
++++++

- i18n methods
- FontAwesome 5.0.13 support

2.0.10
++++++

- Remove bootstrap library
- compatibility with https://www.redmine.org/plugins/issue_id
- bug fix: issue and user macro uses absolute url in mailer notification
- Updated marmaid library to version 8.0.0-rc8
- Updated d3 library to 3.5.17
- Updated nvd3 library to latest 1.8.6
- FontAwesome 5.0.12 support
- Set default values for ui-tooltip css class
- ZeroClipboard updated to 2.3.0

2.0.9
+++++

- Updated bootstrap library to 4.0.0
- Drop angular_gantt library
- enables deface overwrite directory for all installed plugins (not only additionals)
- Updated d3plus to version v2.0.0-alpha.16
- add "Assign to me" to issues
- add "Status on sidebar" for issues
- add link to create new issue on user profile
- FontAwesome 5.0.8 support
- Add marmaid library

2.0.8
+++++

- Provide XLSX helper (and drop XLS helper)
- FontAwesome 5.0.6 support
- add list support for rake task setting_set

2.0.7
+++++

- FontAwesome 5.0.2 support
- Switching to SLIM template engine

2.0.6
+++++

- add rake tasks: drop_settings, setting_get and setting_set
- Updated nvd3 library to 1.8.6
- Updated angularjs libraries to v2.0.0-rc.1
- Wiki iframe macro integration has been added

2.0.5
+++++

- Redmine 3.4 bug fixes
- Helper function fa_icon renamed to font_awesome_icon because of conflicts with redmine_bootstrap_kit
- Cleanups deface overwrites
- add hook for user show
- Traditional Chinese support has been added (thanks to @archonwang)
- Wiki macro for weather with meteoblue has been added
- Wiki macro for google maps has been added
- Wiki macro for issues now supports display a comment and detect issue id and comment id from URL

2.0.4
+++++

- Add group_users macro
- Fix bug with REST-API and assigned_id for issues
- Use user name setting for sort order in macros
- Add invisible_captcha spam protection on registration form

2.0.3
+++++

- Allow remove watchers without re-adding it (only if author or assigned_user changed)
- Fix sort order of users for change author
- Add uninstall documentation
- Add option to disable autowatch issue at user level
- Fixed bug with recurring_tasks plugin and autowatch issues
- Add more unit tests

2.0.2
+++++

- Add option to add involved issue users automatically
- Add change issue author feature
- Fixed bug with Redmine 3.4.x and default assignee settings
- Refactoring patch include and wiki macros

2.0.1
+++++

- Simplified Chinese support has been added (thanks to @archonwang)
- Helper function fa_icon has been added
- Help menu item and MyPage menu item does not require application server restart anymore
- Redmine 3.4.x compatibility

2.0.0
+++++

- Redmine Tweaks has been renamed to additionals, because to resolve loading order problem of Redmine plugins
- Merge common_libraries plugin into additionals plugin
- Fontawesome support
- Redmine 3.0.x required

1.0.3
+++++

- TradingView macro support
- CryptoCompare macro support
- Reddit macro support
- Twitter macro improved with prefix image

1.0.2
+++++

- Smiley/Emoji legacy support

1.0.1
+++++

- Coding standard cleanups
- ruby 2.1.5 required or newer
- version bump

1.0.0
+++++

- user group support for issue auto assign
- optimize deface overwrite path
- drop remove latest projects support (because Redmine 3.2 has dropped latest projects)
- add permission for log time on closed issues - make sure you adjust our permissions!
- code cleanups and bug fixes
- restructure settings
- wiki pdf settings has been added
- updated documentation

0.5.8
+++++

- Fixed top menu items permissions for anonymous and non member #29
- Fixed bug with overwriting application handler, which cases problem with other plugins
- Tweaks link added to admin menu
- replaced user macro with {{user}} syntax (old syntax user#id is not supported anymore)
- more formats for user macro and avatar support
- rename list_users to members
- rename list_projects to projects
- new documentation on https://redmine-tweaks.readthedocs.io
- updated bootstrap-datepicker and fixed zh locale problem
- html validation error has been fixed
- remove garfield support (because there is no image source server available)
- slideshare wiki macro has been added
- issue wiki macro has been added
- autoassign issue if no assignee is selected
- n+1 query optimization

0.5.7
+++++

- Custom source URL for Garfield source
- Wiki footer bug fixed with missing line break at the end of page
- date period support for calendar macro
- Code cleanups

0.5.6
+++++

- Redmine 3.2.x compatibility
- user macro has been added (user#1 or user:admin)
- recently_updated has been added
- lastupdated_by has been added
- lastupdated_at has been added
- calendar macro support
- NoReferrer support has been added
- system information uptime and uname have been added
- twitter macro support
- gist macro support
- vimeo macro support

0.5.5
+++++

- dependency with deface (used to overview views)
- fixed garfield caching macro problem
- you can add content to overview page now (top and bottom)
- some content and view optimization (removed wiki_sidebar compatibility problems with other Redmine plugins)
- Code cleanups and refactoring

0.5.4
+++++

- issue rule added for closing issue with open sub issues
- issue rule added for status change
- issue rule added for assigned_to change

0.5.3
+++++

- Redmine 3.0.x and 3.1.x supported
- "New issue" link with list_projects macro
- Parameter syntax changed for list_users and list_projects macros (sorry for that)

0.5.2
+++++

- "Edit closed issue" permission has been added
- Permissions supported for top menu items

0.5.1
+++++

- "Hide role in memberbox" has been added

0.5.0
+++++

- Redmine 2.6.x compatibility
- URL fixes
- Garfield macro has been added

0.4.9
+++++

- added overview text field
- fix style for "goto top"
- added macro overview help page
- fix compatibility problems with sidebar and other plugins

0.4.8
+++++

- added youtube macro
- project guide subject can be defined for project overview page

0.4.7
+++++

- added jump to top link
- top menu item configuration has been added
- footer configuration (e.g. for imprint url) has been added

0.4.6
+++++

- initialize plugins settings now works with other plugins

0.4.5
+++++

- option to remove help menu item
- Redmine 2.4.1 required

0.4.4
+++++

- installation error fixed
- description update for link handling
- help url now opens in new windows
- sidebar error has been fixed, if no wiki page already exist

0.4.3
+++++

- global gantt and calendar bug fix

0.4.2
+++++

- no requirements of Wiki extensions plugin anymore

0.4.1
+++++

- Fix problem with my page permission

0.4.0
+++++

- First public release
