import React from "react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Login from "../pages/Login/Login";
import Cadastro from "../pages/Cadastro/Cadastro";
import AboutUs from "../pages/AboutUs/AboutUs";
import Produtos from "../pages/Produtos/Produtos";
import Aplicativo from "../pages/Aplicativo/Aplicativo";
import Suporte from "../pages/Suporte/Suporte";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Login />,
  },
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/cadastro",
    element: <Cadastro />,
  },
  {
    path: "/aboutus",
    element: <AboutUs />,
  },
  {
    path: "/produtos",
    element: <Produtos />,
  },
  {
    path: "/app",
    element: <Aplicativo />,
  },
  {
    path: "/suport",
    element: <Suporte />,
  },
]);

export default function RouterComponent() {
  return <RouterProvider router={router} />;
}
