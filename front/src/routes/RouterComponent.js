import React from "react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Login from "../pages/Login/Login";
import Cadastro from "../pages/Cadastro/Cadastro";
import AboutUs from "../pages/AboutUs/AboutUs";
import Categoria from "../pages/Produtos/Categoria";
import Aplicativo from "../pages/Aplicativo/Aplicativo";
import Suporte from "../pages/Suporte/Suporte";
import Produtos from "../pages/Produtos/Produtos";
import Acessorios from "../pages/Produtos/Acessorios";

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
    path: "/categoria",
    element: <Categoria />,
  },
  {
    path: "/app",
    element: <Aplicativo />,
  },
  {
    path: "/suport",
    element: <Suporte />,
  },
  {
    path: "/produtos",
    element: <Produtos />,
  },
  {
    path: "/acessorios",
    element: <Acessorios />,
  },
]);

export default function RouterComponent() {
  return <RouterProvider router={router} />;
}
