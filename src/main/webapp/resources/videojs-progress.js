(function() {
  "use strict";
  var $, Progress, evoClass, vjsProgress;

  $ = jQuery;

  evoClass = function(className, hasDot) {
    return "" + (hasDot ? "." : "") + "vjs-" + className;
  };

  Progress = (function() {
    function Progress(player) {
      this.player = player;
      this.timepoint = {
        initialized: false,
        delimiter: "-vjs-timepoint-",
        data: []
      };
    }

    Progress.prototype.timepoints = function(data) {
      var container, createTimepoint, delimiter, duration, info, inst, player, timepoints, video;
      info = this.timepoint;
      if (info.initialized || !$.isArray(data)) {
        return false;
      }
      inst = this;
      player = this.player;
      video = $(player.el());
      duration = player.duration();
      delimiter = info.delimiter;
      timepoints = info.data;
      container = $("<div />", {
        "class": evoClass("progress-timepoints")
      });
      createTimepoint = function(sec, text) {
        var pt;
        pt = $("<div />", {
          "id": "" + (video.attr("id")) + delimiter + (timepoints.length + 1),
          "class": evoClass("progress-timepoint")
        });
        timepoints.push({
          sec: sec,
          text: text
        });
        return pt.css("left", "" + ((sec / duration) * 100) + "%");
      };
      $.each(data, function(idx, pt) {
        var _ref;
        if ((0 <= (_ref = Number(pt.time)) && _ref <= duration)) {
          return container.append(createTimepoint(Math.round(pt.time), pt.text));
        }
      });
      player.controlBar.progressControl.el().appendChild(container.get(0));
      $(evoClass("progress-timepoint", true)).on("click", function() {
        player.currentTime(inst.timepointData(this.id).sec);
        return false;
      });
      info.initialized = true;
      return true;
    };

    Progress.prototype.timepointData = function(id) {
      return this.timepoint.data[id.split(this.timepoint.delimiter)[1] - 1];
    };

    Progress.prototype.tooltip = function() {
      var duration, formatTime, player, progress, tip, zerofill;
      player = this.player;
      progress = player.controlBar.progressControl;
      duration = player.duration();
      tip = $("<div />", {
        "class": evoClass("progress-tooltip"),
        "text": "0:00"
      });
      zerofill = function(num) {
        if (num < 10) {
          num = "0" + num;
        }
        return num;
      };
      formatTime = function(time) {
        var base;
        time = Math.round(time);
        base = 60;
        if (time < base) {
          time = "00:" + (zerofill(time));
        } else {
          time = "" + (zerofill(Math.floor(time / base))) + ":" + (zerofill(time % base));
        }
        return time;
      };
      progress.el().appendChild(tip.get(0));
      $(progress.el()).on({
        "mousemove": (function(_this) {
          return function(event) {
            var bar, offsetLeft, target, tipText;
            bar = $(progress.el());
            offsetLeft = event.clientX - bar.offset().left;
            target = event.target;
            tipText = formatTime(offsetLeft / bar.width() * duration);
            if ($(target).is(evoClass("progress-timepoint", true))) {
              tipText += "<span>" + (_this.timepointData(target.id).text) + "</span>";
            }
            tip.html(tipText);
            tip.show();
            return tip.css("left", offsetLeft - tip.outerWidth() / 2);
          };
        })(this),
        "mouseleave": function() {
          return tip.hide();
        }
      });
    };

    return Progress;

  })();

  vjsProgress = function(options) {
    var progress;
    progress = new Progress(this);
    this.on("loadedmetadata", function() {
      progress.timepoints(options != null ? options.timepoints : void 0);
      return progress.tooltip();
    });
  };

  videojs.plugin("progress", vjsProgress);

}).call(this);
