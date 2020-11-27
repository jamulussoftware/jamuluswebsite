---
---
function getComments(issueid) {
  var api = "{{ site.ghapiurl }}" + issueid + "/comments";
  var xhr = new XMLHttpRequest();
  xhr.open('GET', api);
  xhr.onload = function() {
      if (xhr.status === 200) {
        var apiResponse = JSON.parse(xhr.responseText);
        if (apiResponse) {
          return apiResponse;
        } else {
          //error
        }
      }
      else {
        // error
      }
  };
  xhr.send();

}

docReady(getComments);
