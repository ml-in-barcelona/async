[%raw "require('./bundled.css')"];

switch (Bindings.getElementById("root")) {
| Some(el) => ReactDOMRe.hydrate(<App />, el)
| None => Js.log("Root element can't be found")
};
