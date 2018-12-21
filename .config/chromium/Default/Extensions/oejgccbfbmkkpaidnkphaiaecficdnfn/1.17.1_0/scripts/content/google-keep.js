'use strict';

// Whole note
togglbutton.render('.IZ65Hb-TBnied:not(.toggl)', { observe: true }, function(
  elem
) {
  var link,
    toolbar = $('.IZ65Hb-INgbqf', elem),
    description = $('.IZ65Hb-YPqjbf:not(.LwH6nd)', elem).textContent,
    tagFunc;

  tagFunc = function() {
    var index,
      tags = [],
      tagItems = $('.IZ65Hb-jfdpUb', elem).children;

    for (index in tagItems) {
      if (tagItems.hasOwnProperty(index) && tagItems[index].classList.contains('notranslate')) {
        tags.push(tagItems[index].textContent);
      }
    }
    return tags;
  };

  link = togglbutton.createTimerLink({
    className: 'keep',
    buttonType: 'minimal',
    description: description,
    tags: tagFunc
  });
  toolbar.appendChild(link);
});

// Checklist inside a note
togglbutton.render(
  '.IZ65Hb-TBnied .gkA7Yd-sKfxWe .CmABtb.RNfche:not(.toggl)',
  { observe: true },
  function(elem) {
    var link,
      position = $('.IZ65Hb-MPu53c-haAclf', elem),
      description = elem.textContent;

    link = togglbutton.createTimerLink({
      className: 'keep',
      buttonType: 'minimal',
      description: description
    });
    position.appendChild(link);
  }
);
