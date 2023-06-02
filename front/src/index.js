import React from "react";
import ReactDOM from "react-dom/client";
import App from "./pages/Login/Login";
import RouterComponent from "./routes/RouterComponent";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <RouterComponent />
  </React.StrictMode>
);
