import { BrowserRouter, Routes, Route } from "react-router-dom";
import LayoutSite from "./layouts/LayoutSite";
import RouterPublic from "./router/RouterPublic";
import RouterPrivate from "./router/RouterPrivate";
import LayoutAdmin from "./layouts/LayoutAdmin";
import UserProvider from "./pages/frontend/Provider/UserProvider";
import AuthProvider from "./pages/frontend/Provider/AuthProvider";
import "./assets/css/style.css";
import Login from "./layouts/LayoutAdmin/Login";
import { ProtectedRoute } from "./pages/frontend/Provider/ProtectedRoute";
function App() {
  return (
    
    <BrowserRouter>

    <UserProvider>
      <Routes>
        <Route path='/' element={<LayoutSite />}>
          {RouterPublic.map(function (route, index) {
            const Page = route.component;
            return <Route key={index} path={route.path} element={<Page />} />
          })}
        </Route>
        <Route path='/admin/login' element={<Login />}> </Route>
        <Route path='/admin' element={
          // <ProtectedRoute>
                <LayoutAdmin />
          //  </ProtectedRoute>
          }>
          {RouterPrivate.map(function (route, index) {
            const Page = route.component;
            return <Route key={index} path={route.path} element={<Page />} />
          })}
        </Route>
      </Routes>
      </UserProvider>

    </BrowserRouter>
    

  );
}

export default App;
