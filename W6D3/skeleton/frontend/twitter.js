const FollowToggle = require("./follow_toggle.js");

$(() => {
  let $followToggleButton = $(".follow-toggle");
  $followToggleButton.each(function() {
    new FollowToggle($(this));
  });
});
