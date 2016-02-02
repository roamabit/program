//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


//# Source: http://dev.w3.org/geo/api/spec-source.html#introduction
    // Request a position. We only accept cached positions, no matter what
    // their age is. If the user agent does not have a cached position at
    // all, it will immediately invoke the error callback.
    navigator.geolocation.getCurrentPosition(successCallback,
                                             errorCallback,
                                             {maximumAge:Infinity, timeout:0});

    function successCallback(position) {
      // By setting the 'maximumAge' to Infinity, the position
      // object is guaranteed to be a cached one.
      // By using a 'timeout' of 0 milliseconds, if there is
      // no cached position available at all, the user agent
      // will immediately invoke the error callback with code
      // TIMEOUT and will not initiate a new position
      // acquisition process.
      if (position.timestamp < freshness_threshold &&
          position.coords.accuracy < accuracy_threshold) {
        // The position is relatively fresh and accurate.
      } else {
        // The position is quite old and/or inaccurate.
      }
    }

    function errorCallback(error) {
      switch(error.code) {
        case error.TIMEOUT:
          // Quick fallback when no cached position exists at all.
          doFallback();
          // Acquire a new position object.
          navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
          break;
        case ... // treat the other error cases.
      };
    }

    function doFallback() {
      // No cached position available at all.
      // Fallback to a default position.
    }
