(function() {
    console.log("Hello World");
    fetch("/hey",
          {
              headers: {
                  'Content-Type': 'application/json'
              },
              method: "POST",
              body: JSON.stringify({
                  'name': 'blackfire'
              })
          })
          .then((res) => {
               console.log(res);
          })
          .catch((res) => {
               console.error(res);
          })
})();
