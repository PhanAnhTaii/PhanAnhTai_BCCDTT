import { useEffect, useState } from "react";
import { Link, useParams,useNavigate } from "react-router-dom";
import orderservice from '../../../services/OrderServce';
import userservice from "../../../services/UserService";

function OrderUpdate() {
    const [users, setUsers] = useState([]);
    useEffect(function () {
        (async function () {
            await userservice.gettAll().then(function (result){
                setUsers(result.data.data);
                });
        })();
    }, []);
    const navigate=useNavigate();
    const [user_id,setUserId]=useState(0);
    const [name,setName]=useState('');
    const [email,setEmail]=useState('');
    const [phone,setPhone]=useState();
    const [address,setAddress]=useState('');
    const [status,setStatus]=useState(1);
    const [note,setNote]=useState('');
    ///////////////
    const { id } = useParams("id");
    ///////////////////
    useEffect(function () {
        (async function () {
            await orderservice.getById(id).then(function (result) {
                const tmp = result.data.data;
                setUserId(tmp.user_id);
                setName(tmp.name);
                setEmail(tmp.email);
                setPhone(tmp.phone);
                setStatus(tmp.status);
                setAddress(tmp.address);
                setNote(tmp.note);
            });
        })();
    }, []);
    ///////////lay danh sach
    const [orders, setOrders] = useState([]);
    useEffect(function () {
        (async function () {
            await orderservice.gettAll().then(function (result) {
                setOrders(result.data.data);
            });
        })();
    }, []);


    async function orderEdit(event) {
        event.preventDefault();
        var order = new FormData();
        order.append("user_id",user_id);
        order.append("name",name);
        order.append("email",email);
        order.append("phone",phone);
        order.append("address",address);
        order.append("note",note);
        order.append("status",status);

        await orderservice.update(order,id)
            .then(function (res) {
                alert(res.data.message)
                navigate('/admin/order', { replace: true })
            });
    }
    return (
    
        <form onSubmit={orderEdit} method="post">
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-danger">
                            CẬP NHẬT ĐƠN HÀNG
                        </strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <button type="submit"className=" btn btn-sm btn-success me-2">
                            Lưu
                        </button>
                        <Link to="/admin/order" className="btn btn-sm btn-info">Về Danh Sách</Link>
                    </div>
                </div>
            </div>
            <div className="card-body">
                <div className="row">
                    <div className="col-md-9">
                    <div className="mb-3">
                            <label htmlFor="user_id">Người Dùng</label>
                            <select name="user_id" value={user_id} className="form-control" onChange={(e) => setUserId(e.target.value)}>
                                <option value="0">None</option>
                                {users.map(function (user, index) {
                                    return (
                                        <option key={index} value={user.id}>{user.name}</option>
                                    )
                                })}
                            </select>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Tên Đơn Hàng</label>
                            <input type="text" name="name" value={name} onChange={(e)=>setName(e.target.value)} className="form-control"/>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Email</label>
                            <input type="text" name="name" value={email} onChange={(e)=>setEmail(e.target.value)}className="form-control"></input>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Địa chỉ</label>
                            <textarea type="text" name="name" value={address} onChange={(e)=>setAddress(e.target.value)} className="form-control"></textarea>
                        </div>
                    </div>
                    <div className="col-md-3">
                    <div className="mb-3">
                            <label htmlFor="name">Số Điện Thoại</label>
                            <input type="text" name="name" value={phone} onChange={(e)=>setPhone(e.target.value)} className="form-control"></input>
                        </div>
                        <div className="mb-3">
                            <label htmlFor="name">Ghi Chú</label>
                            <textarea type="text" name="name" value={note} onChange={(e)=>setNote(e.target.value)} className="form-control"></textarea>
                        </div>
                       
        
                        <div className="mb-3">
                            <label htmlFor="sort">Trạng Thái</label>
                            <select name="sort" value={status} className="form-control" onChange={(e)=>setStatus(e.target.value)}>
                                <option value="1">Xuất Bản</option>
                                <option value="2">Chưa Xuất Bản</option>

                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
);
}
export default OrderUpdate;