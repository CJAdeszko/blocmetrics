# Blocmetrics

### How it works
After registering an application with Blocmetrics, declare an empty `blocmetrics` object in the JavaScript of your application.
```javascript
var blocmetrics = {};
```

Then, add the code that creates the report function as a property of the `blocmetrics` object.
```javascript
blocmetrics.report = function(eventName){
  //create an event JSON object to send to the Blocmetrics analytics service
  var event = {event: { name: eventName }};

  //initialize a new XMLHttpRequest() (AJAX request)
  var request = new XMLHttpRequest();

  //set the HTTP method to POST, the url of our events endpoint, and allow the request to run asynchronously
  request.open("POST", "http://localhost:3000/api/events", true);

  //set the request Content-Type header to 'application/json'. Without that, our API::EventsController would not know to process the request as JSON
  request.setRequestHeader('Content-Type', 'application/json');

  //send the request
  request.send(JSON.stringify(event));
};
```
With this code added to the `registered application`, the `report` function can be called with an argument which will then be passed on in the request to Blocmetrics.

##### Example
```
<%= link_to "Sign Up", new_user_path, class: 'btn btn-primary', :onclick => "blocmetrics.report('sign up link click')" %> today!
```
