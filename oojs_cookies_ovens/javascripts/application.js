// controller
var cookieController = {

  init: function () {
    $('#new_batch').submit(function (event) {
      event.preventDefault();
      var cookie = new Cookie(View.parseForm(this));
      var cookieHTML = View.renderCookieInPrep(cookie);
      cookie.addObserver(View);
      Tray.cookiesInPrep.push(cookie);
      View.putCookieInDOM(cookieHTML);
    });

    $('#prep_batches').on('click', '#add', function () {
      var cookieIndex = $(this).parent().index();
      var cookie = Tray.cookiesInPrep[cookieIndex];
      Oven.addCookie(cookie);
      View.renderCookieInOven(cookie);
    });

    $('#bake').click(function (event) {
      event.preventDefault();
      Oven.bakeContents();
    });
  }
};

var Tray = {
  cookiesInPrep : []
};

// models
function Cookie(inputs) {
  this.type = inputs[0] 
  this.bakeTime = inputs[1]
  this.status = "raw",
  this.timeInOven = 0;
  this.id = Date.now();
}

Cookie.prototype = {
  observers: [],
  bake: function() {
    this.timeInOven += 1; 
    this.updateStatus();
    this.notifyObservers();
  },

  updateStatus: function() {
    switch (this.timeInOven - this.bakeTime) {
      case (-2):
        this.status = "still_gooey";
        break;
      case (-1):
        this.status = "almost ready";
        break;
      case (0):
        this.status = "just_right";
        break;
      case (1):
        this.status = "crispy";
        break;
    }
  },

  notifyObservers: function() {
    var that = this;
    $.each(this.observers, function(index, item) {
      console.log(item);
      View.notify(that);
    });
  },

  addObserver: function(o) {
    this.observers.push(o);
  },
};

var Oven = {
  cookiesInOven: [],

  addCookie: function (cookie) {
    this.cookiesInOven.push(cookie);
  },

  bakeContents: function () {
    this.cookiesInOven.map(function (item) {
      item.bake();
    });
  }
};

// view
View = {
  parseForm: function(that) {
    var cookieForm = $(that).serializeArray();
    var type = cookieForm[0].value
    var bakeTime = cookieForm[1].value;
    return [type, bakeTime]
  },

  renderCookieInPrep: function (cookie) {
    return "<li>" + cookie.type +
      "<button id='add'>Add to Oven</button>" +
      "</li>";
  },

  renderCookieInOven: function (cookie) {
    cookie = "<tr><td id='"+cookie.id+"' class='"+cookie.status+"'>" + cookie.type +
      "<span class='status'>[" + cookie.status + "]</span></td></tr>";
    $(cookie).appendTo('#oven tbody');
  },

  notify: function(cookie) {
    var cookieHTML = $('#' + cookie.id);
    cookieHTML.removeClass();
    cookieHTML.addClass(cookie.status);
    cookieHTML.find('span').text(cookie.status);
  },

  putCookieInDOM: function (cookie) {
    $(cookie).appendTo('#prep_batches  }');
  }
};

// doc ready
$(document).ready(function () {
  cookieController.init();
});

