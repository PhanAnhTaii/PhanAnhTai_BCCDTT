import { Outlet } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import Header from "./Header";
import Footer from "./Footer";

function LayoutAdmin(){
    return (
    <>
    <Header/>
    <Outlet/>
    <Footer/>
    </>
    );
}
export default LayoutAdmin;