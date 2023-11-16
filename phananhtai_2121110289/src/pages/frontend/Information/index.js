import Logo from "../../../assets/images/user.jpg";
import { FaMapMarkerAlt } from 'react-icons/fa';
import { useAuth } from "../Provider/UserProvider";
import { Navigate } from "react-router-dom";

function Information() {
    const {token,setToken}=useAuth();
    if(!token){
        return <Navigate to="/dang-nhap"/>
    }
    const handleSignout=()=>{
        setToken();
    }
    return (
        <>
           
                <div className="container">
                    <h2 className="title-page text-danger text-center fs-1 ">Thông Tin</h2>
                </div>
            
            <section className="section-content padding-y my-2">
                <div className="container my-2">

                    <div className="row">
                        <aside className="col-md-3">
                            <nav className="list-group">
                                <a className="list-group-item active" href="page-profile-main.html"> Account overview  </a>
                                <a className="list-group-item" href="page-profile-address.html"> My Address </a>
                                <a className="list-group-item" href="page-profile-orders.html"> My Orders </a>
                                <a className="list-group-item" href="page-profile-wishlist.html"> My wishlist </a>
                                <a className="list-group-item" href="page-profile-seller.html"> My Selling Items </a>
                                <a className="list-group-item" href="page-profile-setting.html"> Settings </a>
                                <button className="list-group-item" onClick={handleSignout}> Log out </button>
                            </nav>
                        </aside>
                        <main className="col-md-9">

                            <article className="card mb-3">
                                <div className="card-body">

                                    <figure className="icontext ">
                                        <div className="icon">
                                            <img className="rounded-circle img-sm border" style={{height:100,width:100}}src={Logo} />
                                        </div>
                                        <div className="text">
                                            <strong>{token.name}</strong> <br />
                                            <p className="mb-2"> watchstore@gmail.com  </p>
                                            
                                        </div>
                                    </figure>
                                    <hr />
                                    <p>
                                        <i className="fa fa-map-marker text-muted"></i><FaMapMarkerAlt/> My address:
                                        <br />
                                        103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh
                                        <a href="#" className="btn-link"> Edit</a>
                                    </p>



                                    <article className="card-group card-stat">
                                        <figure className="card bg">
                                            <div className="p-3">
                                                <h4 className="title">38</h4>
                                                <span>Orders</span>
                                            </div>
                                        </figure>
                                        <figure className="card bg">
                                            <div className="p-3">
                                                <h4 className="title">5</h4>
                                                <span>Wishlists</span>
                                            </div>
                                        </figure>
                                        <figure className="card bg">
                                            <div className="p-3">
                                                <h4 className="title">12</h4>
                                                <span>Awaiting delivery</span>
                                            </div>
                                        </figure>
                                        <figure className="card bg">
                                            <div className="p-3">
                                                <h4 className="title">50</h4>
                                                <span>Delivered items</span>
                                            </div>
                                        </figure>
                                    </article>


                                </div>
                            </article>



                        </main>
                    </div>

                </div>
            </section>
        </>
    );
}

export default Information;