'use strict';

togglbutton.render(
  '.page-content .widget-toolbox .pull-left:not(.toggl)',
  { observe: true },
  function(elem) {
    var link,
      description = document.querySelector('td.bug-summary').textContent,
      project = document.querySelector('td.bug-project').textContent;

    link = togglbutton.createTimerLink({
      className: 'mantishub',
      description: description,
      projectName: project
    });

    elem.appendChild(link);
  }
);

// Classic UI
togglbutton.render(
  '#view-issue-details:not(.toggl)',
  { observe: true },
  function(elem) {
    var link,
      description = $('td.bug-summary', elem).textContent,
      project = $('td.bug-project', elem).textContent;

    link = togglbutton.createTimerLink({
      className: 'mantishub',
      description: description,
      projectName: project
    });

    $('.form-title', elem).appendChild(link);
  }
);
