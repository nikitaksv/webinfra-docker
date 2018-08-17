Manual
======

General section
--------------

The general section tab allows you to define some special behaviours for your Redmine installation.
It is divided into two areas called ``Contents`` and ``Settings``.

Contents
++++++++

The following plugin options are available to be edited by users with administration rights in the area **Contents**:

* Text for login page. This section is for a short information on the login page below the login mask. For example who to contact in order to get Redmine access.
* Global sidebar. Place your global information here, if needed. Use wiki links or available macros that can be seen by every one.
* Project wide footer. In case you want to put some information about your company or for your imprint. Here you can also use wiki syntax for structuring your text.

Settings
++++++++

And the following options can be edited by users with administratios rights in the area **Settings**:

* Add "Go to top" link. If you have a lot of long pages, it is enabling users to easily return to the top of a page.
* Change the option for ``External urls`` into default behaviour, open in new window or open with NoReferrer.
* Activate the ``Smileys and Emoji symbols support`` if you want to use the manual smiley code (e.g. ``:kiss:``). This option is deactivated in the standard setting. If you already use a plugin that supports Smileys and Emojis this option should stay deactivated. For more info on Emoji-Browser support read http://caniemoji.com/. Have a look at the Emoji cheat sheet at https://www.webpagefx.com/tools/emoji-cheat-sheet for available Emoji-Codes.

.. note:: Please restart the application server, if you make changes to the external urls settings as well as if you activate the Smileys and Emoji symbol support.

.. note:: You can use the following manual smiley codes: :), =), :D, =D, :'(, :(, ;), :P, :O, :/, :S, :|, :X, :*, O:), >:), B), (!), (?), (v), (x), (/) and @}->-

Overview page section
---------------------

If you click on this tab you get to the area, where you can customize contents and settings for your overview page in Redmine.
These settings allows you to define some special behaviours for your Redmine installation.
It is divided into two areas called ``Contents`` and ``Settings``.

Contents
++++++++

The following plugin options are available to be edited by users with administration rights in the area **Contents**:

* Overview page, right. Place information here you want to display at the right side of your overview page.
* Overview page, top. Place information here you want to display at the top of your overview page.
* Overview page, bottom. Place information here you want to display on the bottom of your overview page.

All text input fields allow wiki syntax. Keep your text information as short as possible. In case you want to write prosa, you may also link to a wiki page with further information.

Settings
++++++++

Changes you can make in the area **Settings** are:

* Remove **Latest news** from overview page in case you do not use the **News** function very often. *Remember:* Old news is bad news.

Wiki section
------------

If you click on this tab you get to the area, where users with administration rights can customize contents and settings for your Wiki pages in Redmine.
It is divided into two areas called **Contents** and **PDF Wiki settings**.

Contents
++++++++

Changes you can make in the area **Contents** are:

=========================  ===========================================================================================
Field                      Description
=========================  ===========================================================================================
Global wiki sidebar        Here you can implement useful macros like a display of your page hierarchy.
                           But remember - only people with the correspondent rights will get a display of the content.
Project wide wiki header   You can also implement useful macros in this section.
Project wide wiki footer   For example to implement some date or author macros (e.g. last_updated_at, last_updated_by)
=========================  ===========================================================================================

.. note:: Use simple text, macros and wiki syntax for your content.

PDF Wiki settings
+++++++++++++++++

Changes you can make in the area **PDF Wiki settings** are:

=================================  =====================================================================================================
Field                              Description
=================================  =====================================================================================================
Wiki PDF header                    This block will display the defined text in front of the regular Wiki page content in the PDF view.
                                   The use of macros is very restricted. And it is not possible to add images.
                                   You can only use your Wiki text syntax to adjust the text display.
Remove Wiki title from PDF view    When activated the general Wiki title info in the page header of the PDF viewl will not be displayed.
Remove attachments from PDF view   When activated the attachments will not be displayed in the PDF view of a Wiki page.
=================================  =====================================================================================================

Issues section
--------------

Here you can define issue rules, which are used in issues of all projects as well as special issue content and other settings.

Contents
++++++++

The following plugin options are available to be edited by users with administration rights in the area **Content**:

* Note for new tickets. Use this section if you want to place important issue notes above every new issue. Keep it short and use a link to a common wiki page with further information.

.. note:: You can use wiki syntax for your text, but use it wisely.

Settings
++++++++

The following options are available at the moment in the area **Settings** where you can define rules which will be used in all projects:

* New issue on user profile. Activate this option in case you want to display the symbol link ''New issue'' on a user's profile page in the top right corner in order to add a new issue for this user directly from it's user profile page.
* Show ''Assign to me'' on issue. Activate this option if you want to display the symbol link ''Assign to me'' in the issue overview page of an issue that you are able to assign it directly to yourself without *editing* the issue. The link is only shown to users who are also members in the correspondent project.
* Issue status on sidebar. Activate this option in case you want to display a list of available issue status options in the right sidebar of the issue view page. One click on the option changes the issue status directly without opening the *edit* mode.

.. note:: All three options above only work for users with appropriate issue tracking rights in the administration area "Roles and permissions" (view, add, edit).

* Add involved users as watcher automatically. This means, everyone who is or has been involved in the issue (Assignee, Editor, Author etc.) will automatically be notified about further changes. At the same time the user finds an additional option in his user account edit mode called ``Autowatch involved issues`` (see figure 1). Deactivate this option if you don't want to be notified.
* Issues with open sub-issues cannot be closed.
* If "Assignee" is unchanged and the issue status changed from x to y, than the author is assigned to the issue.

.. figure::  images/account-preferences.jpg
   :align:   center

   Figure 1: Deactivate this option in your account in case you don't want to be notified even if the admin activated it.

.. note:: Use Case for this option: issues should be automatically assigned to author, if the status changes to *Approval*.

* Current issue status x is only allowed if *Assignee* is the current user.

.. note:: Is this function used in combination with the setting option *Issue status on sidebar* then the current user will automatically be assigned to the issue while changing the issue status. Use Case here: Users are only allowed to change the status to *In Progress* if they are the person who is actually working on the issue right now.

* If ''Assigned to'' is not assigned to a user and the new issue status is x then the issue is auto assigned to the first group with users of the pre-defined role.

.. note:: Use Case: The issue author does not know whom the issue should be assigned to. Or he is unsure who will be responsible for solving the task. In that case the issue for example with the status "To Do" is automatically assigned to the first group, which does contain a user of the pre-selected project manager role. Imagine you have a group called "Support", and there are users assigend to the "Manager" role, this support group will be automatically adressed to solve the issue when the issue author saves it.

Projects section
----------------

The projects section offers several options for the user with admin rights to define texts, which will be displayed in the project areas of Redmine as well as disable special modules which should not be available for projects.

* Project guide. The project guide box will provide every user information that is necessary for your Redmine projects. Here you can link to a wiki page or leave a text message.
* ``Disable modules``, this feature will hide the selected modules in the project settings. Even if the module is enabled for use in the admin area it can not be selected by the project manager within the projects. Please note, if these modules already activated in existing projects, you will have to change and re-save the respective project settings first.

.. note:: Use simple text, macros and wiki syntax for your content of the project guide. Make sure every one has access to the displayed information in case you link to a wiki page.

Menu section
------------

First of all: This section is only visible in case the *Redmine HRM Plugin* is not installed. If you are also using the *Redmine HRM Plugin* this section disappears because the functionality is also an important part of ''HRM''.
Otherwise, you can define here new top menu items and change some standard settings on the menu behaviour.

.. note:: Please restart the application server, if you remove a menu item or change permissions as well as changing the custom help url.

This area offers you the possibility to add up to 5 additional menu items to your Redmine main menu.
The following input fields are available for each entry:

============  ========================================
Field         Description
============  ========================================
Name          Enter the name of the menu item.
URL           Enter an URL starting with ``http://``
Title         Enter an title (optional)
Permissions   Select one ore more existing roles to which the menu item will be displayed.
              Only members of selected roles will be displayed in this list.
============  ========================================

Settings
++++++++

In the **Settings** area of the menu tab there are the following functions available.

* Enter a ``Custom help URL`` instead of linking to the help on Redmine.org. Make sure you restart your application server after your changes.
* Remove ``Help`` from top menu in order to keep the menu shorter.
* Remove ``My Page`` from top menu in order you don't want your users to use this page.

User section
----------------

In case you want to use a SPAM protection for the user registration page you can activate a spam protection function in this area which is based on the honeypot strategy to provide a better user experience.
We use the simple and flexible SPAM protection solution for Rails applications called ``invisible_captcha`` for it.

In order to activate the checkbox ``SPAM protection for registration`` you must have enabled the registration process in your Redmine settings (Authentication - Self-registration). Otherwise it is not possible to use this function.

.. note:: CAPTCHA is short for ``Completely Automated Public Turing test to tell Computers and Humans Apart``. It is a type of test to determine whether or not the user is human. The honeypot strategy is an alternative and fairly simple. It puts a field onto your form that humans won't fill out because they don't see it. Most spam bots search for forms, fill out every field and submit it. If the honeypot captcha field is filled out you know for sure it is a spam submission.

Web APIs section
----------------

In case you want to use the Gmap Macro you have to implement your Google API Key into the field ``Google Maps Embed API Key`` first. After this you can use the Macro everywhere inside Redmine (Wiki, Issues - everywhere you use wiki syntax).

Macros section
--------------

Because it's sometimes hard to remember what kind of macros you can use in your Redmine installation we implemented the macro section.
Here is simply displayed a list of all available Redmine macros of your installation, which are provided by Redmine in general and the installed Redmine plugins.
Macros can be used in the Wiki of a project or as well as in the text area of an issue, for example. For more information on how to add macros use the Redmine help.

Additional permissions
----------------------

The following permissions are provided by the plugin and must be configured in the administration area ``Roles and permissions`` for the plugin functions to make sure it's working properly.

**Hide in member box**. This permission hides members of the selected role in the member box of each project. Project members of other roles will still be listed. For example: You don't want others to catch a glimpse of your development team (Role: Development). So activate the role "Developer" to hide the list of your team members assigned to this role in this box. This function is also useful if your member box is too crowded.

**Show hidden roles in member box**. In case you have hidden roles in a project that should not be displayed you can give to some special roles the permission to display the members however.

**Edit issue author**. This permission will always record any changes made to the issue author. You can change the author only in the issue edit mode.

**Edit closed issues**. Set this option to those roles you don't want to edit closed issues. Normally a closed issue should not be edited anymore.

**Set author of new issues**. This permission should be set carefully, because in case you allow this, there is no history entry set for this. You will never know if the author has been originally someone else. Normally you don't want this.

**Log time to closed issues**. Our plugin does not allow time logs to closed issues. In case you still want to allow your members to log time to closed issues, you need to change the permission here.
