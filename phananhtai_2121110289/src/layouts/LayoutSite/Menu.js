import { useEffect } from "react";
import { useState } from "react";
import { Link } from "react-router-dom";
import Logo from '../../assets/images/Logo.png'
import menuservice from "../../services/MenuService";
import MenuItem from "./MenuItem";
import { FaSearch, FaShoppingCart } from "react-icons/fa";
import { faUser } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { useAuth } from "../../pages/frontend/Provider/UserProvider";


function Menu() {
  const [key, setKey] = useState("");
  const [menus, setMenus] = useState([]);
  const {token}=useAuth();
  useEffect(function () {
    (async function () {
      await menuservice.getByParentId('mainmenu', 0).then(function (result) {
        setMenus(result.data.menus);
      });
    })();
  }, [])

  return (
    <nav className="navbar navbar-expand-lg border-top" style={{ backgroundColor: "white" }}>
      <div className="container-fluid mb-2">
        <Link className="navbar-brand d-sm-block  fs-3 text-warning" to="/"><img src={Logo} alt="logo" style={{ width: 230, height: 50, paddingTop: 10, paddingLeft: 10 }} /></Link>
        <button className="navbar-toggler text-white " type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav me-auto mb-2 mb-lg-0 ">
            {menus.map(function (menu, index) {
              return (<MenuItem menu={menu} key={index} />

              );
            })}
          </ul>
          <form className="d-flex me-4 " role="search" >
            <input className="form-control me-2 "style={{width:300}} type="text" value={key} onChange={(e) => setKey(e.target.value)} placeholder="Tìm kiếm theo thương hiệu" aria-label="Search" />
            <Link className="btn btn-outline-success" to={"/tim-kiem/" + key} >Search</Link>
          </form>        
              <div className="me-3 "><div className="fs-3 text-danger"><Link to="thong-tin"><FontAwesomeIcon className="text-danger"icon={faUser} /></Link></div></div>

              <div className=" me-4" style={{ paddingBottom: 5 }}>Xin chào<br />
              {!token ?  (<Link style={{ textDecorationLine: "none" }} to="/dang-nhap"><strong className='text-danger '>Đăng nhập</strong></Link>) : token.name}
             </div>            
          
          <div className="me-4">  
            <Link to="gio-hang">
              <FaShoppingCart className="text-danger" style={{ color: "green", width: 30, height: 30 }} />
              {/* <span class="position-absolute  translate-middle badge rounded-pill bg-black">
                0
                <span class="visually-hidden">unread messages</span>
              </span> */}
            </Link></div>
            <div className="me-1">  
            <Link to="/admin/login" style={{ textDecorationLine: "none", color: "black"}}>
              <strong>Quản Trị</strong>
            </Link></div>
        </div>
      </div>
    </nav>
  );
}
export default Menu;












