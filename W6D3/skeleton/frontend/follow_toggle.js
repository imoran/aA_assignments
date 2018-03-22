const APIUtil = require("./api_util");

class FollowToggle {
  constructor($el) {
    this.followState = $el.data("initial-follow-state");
    this.userId = $el.data("user-id");
    this.$el = $el;
    this.render();
    this.bindEvents();
  }

  render() {
    if (
      this.$el.data("initial-follow-state") === true &&
      !this.$el.hasClass("disabled")
    ) {
      this.$el.text("Unfollow");
    } else {
      this.$el.text("Follow");
    }
  }

  async handleClick($button) {
    let type = $button.data("initial-follow-state") ? "delete" : "post";
    let response;
    debugger;
    if (type === "delete") {
      $button.text("Unfollowing...");
      $button.addClass("disabled");
      response = APIUtil.unfollowUser(this.userId);
      await response;
      this.render();
    } else {
      debugger;
      $button.text("Following...");
      $button.addClass("disabled");
      this.render();
      response = APIUtil.followUser(this.userId);
      console.log("this.userId", this.userId);
      await response;
    }
    // console.log("response", response);
    $button.removeClass("disabled");
    let value = $button.data("initial-follow-state") ? false : true;
    $button.data("initial-follow-state", value);
    this.render();
  }

  async bindEvents() {
    await this.$el.on("click", event => {
      const $button = $(event.target);
      this.handleClick($button);
    });
  }
}

module.exports = FollowToggle;
