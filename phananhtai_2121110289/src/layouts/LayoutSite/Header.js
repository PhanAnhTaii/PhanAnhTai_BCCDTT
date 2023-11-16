import Logo from '../../assets/images/Logo.png'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart } from '@fortawesome/free-solid-svg-icons'
import { faPhone } from '@fortawesome/free-solid-svg-icons'
import { faUser } from '@fortawesome/free-solid-svg-icons'
import { FaShoppingCart, FaPrint, FaSearch } from 'react-icons/fa';
import { Link } from "react-router-dom";
import { useState } from 'react'
function Header() {
    const [key, setKey] = useState("");

    return (
        <section className="header py-3 ">
            <div className="container>" >
                <div className="row ">
                    <div className="col-md-4">
                       < Link to="/ "><img src={Logo} alt="logo" style={{ width: 300, paddingLeft: 70 }} /></Link>
                    </div>
                    <div className="col-md-5">
                        <form className="d-flex me-4" role="search">
                            <input style={{width:600}}  className="form-control me-2" type="text" value={key} onChange={(e) => setKey(e.target.value)} placeholder="Tìm kiếm" aria-label="Search" />
                            <Link className="btn btn-outline-success" to={"/tim-kiem/" + key} >Search</Link>
                        </form>
                    </div>
                    <div className="col-md-1">
                        <div className=""><div className="fs-3 text-danger"><FontAwesomeIcon icon={faUser} /></div></div>
                    </div>
                    <div className="col-md-1">
                        <div className="" style={{ paddingBottom: 5 }}>Xin chào<br /><Link style={{ textDecorationLine: "none" }}
                            to="/dang-nhap"><strong className='text-danger '>Đăng nhập</strong></Link></div>
                    </div>
                    <div className="col-md-1">
                        <div className="me-4" >
                            <Link to="gio-hang">
                                <FaShoppingCart className="" style={{ color: "green", width: 30, height: 30 }} />
                            </Link></div></div>
                </div>
            </div>
        </section>
    );
}
export default Header;