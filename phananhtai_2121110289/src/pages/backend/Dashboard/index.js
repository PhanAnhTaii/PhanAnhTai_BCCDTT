import { Link, Navigate } from "react-router-dom";
import { useAuth } from '../../frontend/Provider/UserProvider';


function Dashboard() {
    // const {user}=useAuth();
    // if(!user){
    //     return <Navigate to="/admin/login"/>
    //   }
    return (
        <>
        <div style={{backgroundImage:"#e21da2"}}>
        <h1 className="text-center text-danger bg-indigo-500 fs-1 py-2" >Dashboard</h1>
        </div>
        <div>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="brand"><strong>THƯƠNG HIỆU</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="category"><strong>DANH MỤC</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="contact"><strong>LIÊN HỆ</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="product"><strong>SẢN PHẨM</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="order"><strong>ĐƠN HÀNG</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="post"><strong>BÀI VIẾT</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="topic"><strong>CHỦ ĐỀ</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="customer"><strong>KHÁCH HÀNG</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="user"><strong>NGƯỜI DÙNG</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="slider"><strong>BANNER</strong></Link>
            <Link className="btn btn-sm  btn-light col-md-12 fs-4 border-bottom" style={{ height: 70, paddingTop: 17 }} to="menu"><strong>MENU</strong></Link>
        </div>
        </>
    );
}
export default Dashboard;