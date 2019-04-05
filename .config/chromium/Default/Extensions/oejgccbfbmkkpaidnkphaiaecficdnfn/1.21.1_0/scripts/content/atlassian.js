'use strict';

// Jira 2017 board sidebar
togglbutton.render(
  '#ghx-detail-view [spacing] h1:not(.toggl)',
  { observe: true },
  function() {
    var link,
      description,
      rootElem = $('#ghx-detail-view'),
      container = createTag('div', 'jira-ghx-toggl-button'),
      titleElem = $('[spacing] h1', rootElem),
      numElem = $('[spacing] a', rootElem),
      projectElem = $('.bgdPDV');

    description = titleElem.textContent;
    if (numElem !== null) {
      description = numElem.textContent + ' ' + description;
    }

    link = togglbutton.createTimerLink({
      className: 'jira2017',
      description: description,
      buttonType: 'minimal',
      projectName: projectElem && projectElem.textContent
    });

    container.appendChild(link);
    numElem.parentNode.appendChild(container);
  }
);

// Jira 2018-X Sprint Modal
// We select dialog content in order to wait for the SPA to render.
// N.B. this can bring its own issues (see comment about infinite re-renders).
// The h1 element gets replaced and no longer has .toggl class, so we have to be careful.
togglbutton.render(
  'div[role="dialog"] h1:not(.toggl)',
  { observe: true },
  function(needle) {
    var root = needle.closest('div[role="dialog"]'),
      id = $('div:last-child > a[spacing="none"][href^="/browse/"]:last-child', root),
      description = $('h1:first-child', root),
      project = $('[data-test-id="navigation-apps.project-switcher-v2"] button > div:nth-child(2) > div'),
      link;

    if (project === null) {
      project = $('a[href^="/browse/"][target=_self]');
    }

    if (id !== null && description !== null) {
      link = togglbutton.createTimerLink({
        className: 'jira2018',
        description: id.textContent + ' ' + description.textContent,
        projectName: project && project.textContent
      });

      // Link is not placed in exactly the same element as a regular issue page,
      // else we encounter infinite re-renders when the SPA updates the DOM.
      id.parentNode.appendChild(link);
    }
  }
);

// Jira 2018-11 issue page. Uses functions for timer values due to SPA on issue-lists.
togglbutton.render(
  '#jira-frontend:not(.toggl)',
  { observe: true },
  function (elem) {
    var link,
      issueNumberElement,
      container,
      titleElement,
      projectElement;

    // The main "issue link" at the top of the issue.
    // Extra target and role selectors are to avoid picking up wrong links on issue-list-pages.
    issueNumberElement = $('a[href^="/browse/"][target=_blank]:not([role=list-item])', elem);
    container = issueNumberElement.parentElement.parentElement.parentElement;

    function getDescription () {
      var description = '';

      // Title/summary of the issue - we use the hidden "edit" button that's there for a11y
      // in order to avoid picking up actual page title in the case of issue-list-pages.
      titleElement = $('h1 ~ button[aria-label]', elem).previousSibling;

      if (issueNumberElement) {
        description += issueNumberElement.textContent.trim();
      }

      if (titleElement) {
        if (description) description += ' ';
        description += titleElement.textContent.trim();
      }

      return description
    }

    function getProject () {
      var project = '';

      // Best effort to find the "Project switcher" found in the sidebar of most pages, and extract
      // the project name from that. Historically project has not always been picked up reliably in Jira.
      projectElement = $('[data-test-id="navigation-apps.project-switcher-v2"] button > div:nth-child(2) > div');
      // Attempt to find the project name in page subtitle in case the sidebar is hidden
      if (!projectElement) projectElement = $('a[href^="/browse/"][target=_self]')

      if (projectElement) {
        project = projectElement.textContent.trim();
      }

      return project
    }

    link = togglbutton.createTimerLink({
      className: 'jira2018',
      description: getDescription,
      projectName: getProject
    });

    container.appendChild(link);
  }
);

// Jira 2017 issue page
togglbutton.render(
  '.issue-header-content:not(.toggl)',
  { observe: true },
  function(elem) {
    var link,
      description,
      numElem = $('#key-val', elem),
      titleElem = $('#summary-val', elem) || '',
      projectElem = $('.bgdPDV');

    if (!!titleElem) {
      description = titleElem.textContent.trim();
    }

    if (numElem !== null) {
      if (!!description) {
        description = ' ' + description;
      }
      description = numElem.textContent + description;
    }

    if (projectElem === null) {
      projectElem = $('[data-test-id="navigation-apps.project-switcher-v2"] button > div:nth-child(2) > div');
    }
    // JIRA server support
    if (projectElem === null) {
      projectElem = $('#project-name-val');
    }

    link = togglbutton.createTimerLink({
      className: 'jira2017',
      description: description,
      projectName: projectElem && projectElem.textContent.trim()
    });

    link.style.marginLeft = '8px';

    var issueLinkContainer =
      $('.issue-link').parentElement || $('.aui-nav li').lastElementChild;
    issueLinkContainer && issueLinkContainer.appendChild(link);
  }
);

// Jira pre-2017
togglbutton.render('#ghx-detail-issue:not(.toggl)', { observe: true }, function(
  elem
) {
  var link,
    description,
    container = createTag('div', 'ghx-toggl-button'),
    titleElem = $('[data-field-id="summary"]', elem),
    numElem = $('.ghx-fieldname-issuekey a'),
    projectElem = $('.ghx-project', elem);

  description = titleElem.textContent;
  if (numElem !== null) {
    description = numElem.textContent + ' ' + description;
  }

  link = togglbutton.createTimerLink({
    className: 'jira',
    description: description,
    projectName: projectElem && projectElem.textContent
  });

  container.appendChild(link);
  $('#ghx-detail-head').appendChild(container);
});

// Jira pre-2017
togglbutton.render(
  '.issue-header-content:not(.toggl)',
  { observe: true },
  function(elem) {
    var link,
      description,
      ul,
      li,
      numElem = $('#key-val', elem),
      titleElem = $('#summary-val', elem) || '',
      projectElem = $('#project-name-val', elem);

    if (!!titleElem) {
      description = titleElem.textContent;
    }

    if (numElem !== null) {
      if (!!description) {
        description = ' ' + description;
      }
      description = numElem.textContent + description;
    }

    link = togglbutton.createTimerLink({
      className: 'jira',
      description: description,
      projectName: projectElem && projectElem.textContent
    });

    ul = createTag('ul', 'toolbar-group');
    li = createTag('li', 'toolbar-item');
    li.appendChild(link);
    ul.appendChild(li);
    $('.toolbar-split-left').appendChild(ul);
  }
);

//Confluence
togglbutton.render('#title-heading:not(.toggl)', { observe: true }, function(
  elem
) {
  var link,
    description,
    titleElem = $('[id="title-text"]', elem);

  description = titleElem.textContent.trim();

  link = togglbutton.createTimerLink({
    className: 'confluence',
    description: description
  });

  $('#title-text').appendChild(link);
});
