'use strict';

togglbutton.render('#ctl00_ctl00_PageBody_tktHeader', {}, function() {
  var link,
    returnPos,
    description = '',
    object = $('#ctl00_ctl00_PageBody_lbSubject');

  description = object.textContent;
  returnPos = description.indexOf('\n');
  if (returnPos > 0) {
    description = description.substr(0, description.indexOf('\n'));
  }

  link = togglbutton.createTimerLink({
    className: 'sherpadesk',
    description: description
  });

  object.parentElement.appendChild(link);
});
